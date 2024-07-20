# This file tests a per-environment scenario
# Make sure all branches except main (local) + origin/main (remote) have been deleted
# ALSO: Will need to delete all test files in main branch (Manually).
<#
To remove branches:
-------------------
git branch
git branch -d <name>
git switch <name>
git push origin --delete Features/999999
#>

# --------------------------------------

# Delete branches

git checkout main
git branch -D dev
git branch -D pfx
git branch -D features/1dev
git branch -D features/1pfx
git branch -D features/1main
git branch -D features/2

git push origin --delete dev
git push origin --delete pfx
git push origin --delete features/1dev
git push origin --delete features/1pfx
git push origin --delete features/1main
git push origin --delete features/2

# --------------------------------------
# 1. Create branches
# --------------------------------------

git branch dev
git push -u origin dev

git branch pfx
git push -u origin pfx

# feature branch to make change into dev
git branch features/1dev
git push -u origin features/1dev

# feature branch to make a change into pfx
git branch features/1pfx
git push -u origin features/1pfx

# feature branch to make a change into main
git branch features/1main
git push -u origin features/1main

git log --oneline --graph --all --decorate -10

# ------------------------------------------------
# 2. Create commit on dev branch via feature branch
# ------------------------------------------------

git checkout features/1dev
'newfile' | Out-File -FilePath 1dev.txt
git status
git add 1dev.txt
git status
git commit -m "added 1dev.txt"
git push origin

# Merge

git checkout dev
git status
git merge features/1dev
git push origin dev

git log --oneline --graph --all --decorate -10

# ------------------------------------------------
# 3. Create commit on pfx branch via feature branch
# ------------------------------------------------

git checkout features/1pfx
'newfile' | Out-File -FilePath 1pfx.txt
git status
git add 1pfx.txt
git status
git commit -m "added 1pfx.txt"
git push origin

# Merge

git checkout pfx
git status
git merge features/1pfx
git push origin pfx

git log --oneline --graph --all --decorate -10

# ------------------------------------------------
# 4. Create commit on main branch via feature branch
# ------------------------------------------------

git checkout features/1main
'newfile' | Out-File -FilePath 1main.txt
git status
git add 1main.txt
git status
git commit -m "added 1main.txt"
git push origin

# Merge

git checkout main
git status
git merge features/1main
git push origin main

git log --oneline --graph --all --decorate -10

# ---------------------------------------------------------------
# 5. Create 1 more commit on dev branch to make it latest commit
# ---------------------------------------------------------------

git checkout features/1dev
'changed' | Out-File -FilePath 1dev.txt
git status
git add 1dev.txt
git status
git commit -m "changed 1dev.txt"
git push origin

# Merge

git checkout dev
git status
git merge features/1dev
git push origin dev

git log --oneline --graph --all --decorate -10

# ---------------------------------------------------------------
# 6. Create new feature branch off main, and add file
# ---------------------------------------------------------------

git checkout main # make sure to branch off main
git branch features/2
git push -u origin features/2

git checkout features/2
'newfile' | Out-File -FilePath 2.txt
git status
git add 2.txt
git status
git commit -m "added 2.txt"
git push origin

git log --oneline --graph --all --decorate -10

# ---------------------------------------------------------------
# 7. Finally, add another change to dev branch to make it latest.
# ---------------------------------------------------------------

git checkout features/1dev # make sure to branch off main
'changed again' | Out-File -FilePath 2.txt
git status
git add 2.txt
git status
git commit -m "changed again 2.txt"
git push origin

# Merge

git checkout dev
git status
git merge features/1dev
git push origin dev

git log --oneline --graph --all --decorate -10

<#

... At this point, PRs will show following:

Create a pull request features/2 -> main
----------------------------------------
- 1 file changed

Create a pull request features/2 -> dev
---------------------------------------
- 2 files changed

Create pull request main -> dev
-------------------------------
- 1 file changed

#>

