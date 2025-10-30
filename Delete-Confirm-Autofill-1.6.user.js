// ==UserScript==
// @name         GitHub - Deletion Confirmation Auto-filler (Full-Auto)
// @namespace    https://github.com/NikoboiNFTB/GitHub-Tweaks/
// @version      1.6
// @description  Automatically advances GitHub's repo deletion dialogs and fills the confirmation text (you still click the final confirm). Basically automates every step between the first and the last "Delete this repository."
// @author       Nikoboi
// @match        https://github.com/*/*
// @run-at       document-idle
// @grant        none
// ==/UserScript==

(function() {
  'use strict';

  const DEBUG = false;
  const log = (...args) => DEBUG && console.log('[GitHub Auto-filler]', ...args);

  // Simulated typing helper
  async function simulateTyping(el, text, delay = 60) {
    el.focus();
    el.value = '';
    for (const char of text) {
      el.dispatchEvent(new KeyboardEvent('keydown', { bubbles: true, key: char }));
      el.value += char;
      el.dispatchEvent(new Event('input', { bubbles: true }));
      el.dispatchEvent(new KeyboardEvent('keyup', { bubbles: true, key: char }));
      await new Promise(res => setTimeout(res, delay));
    }
  }

  // Fill in the repo name
  function autoFillConfirmBox() {
    const label = document.querySelector('label[for="verification_field"]');
    const input = document.querySelector('#verification_field');
    if (label && input && !input.value) {
      const match = label.textContent.match(/type\s+"([^"]+)"/i);
      if (match && match[1]) {
        const textToType = match[1];
        log(`Typing "${textToType}"...`);
        simulateTyping(input, textToType).then(() => {
          log('Done typing.');
        });
      }
    }
  }

  // Observe for the final modal appearing (confirmation stage)
  function startConfirmObserver() {
    const observer = new MutationObserver(() => autoFillConfirmBox());
    observer.observe(document.body, { childList: true, subtree: true });
  }

  // Handles sequential clicking of the two intermediate modals
  async function handleDeleteSequence() {
    log('Delete sequence initiated...');

    // Step 1 → Wait for and click the first modal button
    await waitForAndClick('#repo-delete-proceed-button', 2000);

    // Step 2 → Wait a bit for the next modal to render
    await new Promise(res => setTimeout(res, 1500));

    // Step 3 → Click the next modal button (same ID)
    await waitForAndClick('#repo-delete-proceed-button', 2000);

    // Step 4 → Observe and auto-fill confirmation field
    startConfirmObserver();
    autoFillConfirmBox();
  }

  // Utility: wait for an element then click it
  async function waitForAndClick(selector, timeout = 2000) {
    const start = performance.now();
    while (performance.now() - start < timeout) {
      const el = document.querySelector(selector);
      if (el) {
        log(`Clicking ${selector}`);
        el.click();
        return true;
      }
      await new Promise(res => setTimeout(res, 100));
    }
    log(`Timeout waiting for ${selector}`);
    return false;
  }

  // Listen for the very first click (on “Delete this repository”)
  function setupDeleteButtonListener() {
    document.addEventListener('click', e => {
      const deleteBtn = e.target.closest('#dialog-show-repo-delete-menu-dialog');
      if (deleteBtn) {
        log('Primary delete button clicked');
        // Add a short delay to let the modal render
        setTimeout(handleDeleteSequence, 1000);
      }
    });
  }

  function init() {
    setupDeleteButtonListener();
    startConfirmObserver();
    autoFillConfirmBox();
  }

  // Initialize
  init();

  // Re-run after PJAX navigation
  document.addEventListener('pjax:end', () => {
    log('PJAX navigation detected, reinitializing...');
    init();
  });
})();
