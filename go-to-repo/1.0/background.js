const REPO_REGEX = /^[A-Za-z0-9._-]+\/[A-Za-z0-9._-]+$/;

browser.contextMenus.create({
  id: "go-to-repo",
  title: "Go to Repo",
  contexts: ["selection"],
  icons: { "512": "icons/github.svg" },
  visible: true
});

browser.contextMenus.onClicked.addListener((info) => {
  if (info.menuItemId !== "go-to-repo") return;

  const repo = info.selectionText?.trim();
  if (!repo || !REPO_REGEX.test(repo)) return;

  const url = `https://github.com/${repo}/`;
  browser.tabs.create({ url });
});
