// ==UserScript==
// @name         GitHub - Auto-Reload if Pending Deployment
// @namespace    https://github.com/NikoboiNFTB/GitHub-Tweaks
// @version      1.1
// @description  Automatically reload GitHub pages when a pending deployment icon exists.
// @author       Nikoboi
// @match        https://github.com/*/*
// @match        https://github.com/*/*/
// @match        https://github.com/*/*/tree/main
// @match        https://github.com/*/*/tree/main/
// @grant        none
// @icon         https://github.githubassets.com/favicons/favicon-dark.svg
// ==/UserScript==

(function () {
  'use strict';

  function checkForPendingDeployment() {
    const button = document.querySelector(
      'button[data-testid="checks-status-badge-icon"] .octicon-dot-fill'
    );
    return !!button;
  }

  let reloadTimeout = null;
  function scheduleReload() {
    if (!reloadTimeout) {
      console.log('[GitHub AutoReload] Pending deployment detected. Reloading in 1 second(s)...');
      reloadTimeout = setTimeout(() => {
        location.reload();
      }, 1000);
    }
  }

  const observer = new MutationObserver(() => {
    if (checkForPendingDeployment()) {
      scheduleReload();
    }
  });

  observer.observe(document.body, {
    childList: true,
    subtree: true,
  });

  if (checkForPendingDeployment()) {
    scheduleReload();
  }
})();
