# Bulk Rename & Push Workflow for GitHub Repo
---
# 1. Change to your repository folder
cd ~/Documents/nikob/GitHub/<repo-name>
---
# 2. Replace spaces with underscores
find . -type f -name "* *" -exec rename 's/ /_/g' "{}" +
# Optional preview mode
find . -type f -name "* *" -exec rename -n 's/ /_/g' "{}" +
---
# 3. Replace '_-_' sequences with '_'
find . -type f -name "*_-_*" -exec rename 's/_-_/_/g' "{}" +
# Optional preview mode
find . -type f -name "*_-_*" -exec rename -n 's/_-_/_/g' "{}" +
---
# 4. Remove unwanted substring '_Simple_and_Fast_Redirect_Portal'
find . -type f -name "*_Simple_and_Fast_Redirect_Portal*" -exec rename 's/_Simple_and_Fast_Redirect_Portal//g' "{}" +
# Optional preview mode
find . -type f -name "*_Simple_and_Fast_Redirect_Portal*" -exec rename -n 's/_Simple_and_Fast_Redirect_Portal//g' "{}" +
---
# 5. Optional: Normalize multiple underscores
find . -type f -name "*__*" -exec rename 's/__/_/g' "{}" +

# 6. Verify the changes
git status
---
# 7. Stage all changes
git add -A
---
# 8. Commit changes
git commit -m "Bulk rename files: spaces → underscores, cleaned filenames"
---
# 9. Push changes to GitHub
git push origin main
# Replace 'main' with your branch name if different
