// ==UserScript==
// @name         GitHub - Deletion Confirmation Auto-filler (Semi-Auto)
// @namespace    https://github.com/NikoboiNFTB/GitHub-Tweaks/
// @version      1.2
// @description  Automatically types the confirmation phrase when deleting a repository on GitHub.
// @author       Nikoboi
// @match        https://github.com/*/*
// @run-at       document-idle
// @grant        none
// @icon         https://github.com/fluidicon.png
// ==/UserScript==

(function() {
  'use strict';

  console.log('[GitHub Auto-Confirm Deletion] Loaded.');

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

  function autoFillConfirmBox() {
    const label = document.querySelector('label[for="verification_field"]');
    const input = document.querySelector('#verification_field');
    if (label && input && !input.value) {
      const match = label.textContent.match(/type\s+"([^"]+)"/i);
      if (match && match[1]) {
        const textToType = match[1];
        console.log(`[GitHub Auto-Confirm Deletion] Typing "${textToType}"...`);
        simulateTyping(input, textToType).then(() => {
          console.log('[GitHub Auto-Confirm Deletion] Done typing.');
        });
      }
    }
  }

  function startObserver() {
    const observer = new MutationObserver(() => autoFillConfirmBox());
    observer.observe(document.body, { childList: true, subtree: true });
    autoFillConfirmBox();
  }

  // Run initially
  startObserver();

  // Re-run after PJAX navigation (GitHub’s AJAX page load)
  document.addEventListener('pjax:end', () => {
    console.log('[GitHub Auto-Confirm Deletion] PJAX navigation detected, reinitializing...');
    startObserver();
  });
})();
