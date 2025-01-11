@echo off
:: Ensure the script is running from the Git repository directory
set REPO_DIR="C:\Users\n0stal6ic\Desktop\n0stal6ic.github.io"

:: Ask for the file path to upload
set /p FILE_PATH="Enter the path to the file you want to upload: "

:: Check if the file exists
if not exist "%FILE_PATH%" (
    echo The file does not exist.
    exit /b
)

:: Ask for the commit message
set /p COMMIT_MSG="Enter commit message: "

:: Reset the current repository to remove all history for the file
git rm --cached "%FILE_PATH%"

:: Remove all history related to the file (if file was previously tracked)
git commit --amend --no-edit --date "$(date)"

:: Add the file again as if it's new (no history)
git add "%FILE_PATH%"

:: Commit the new file without history
git commit -m "%COMMIT_MSG%"

:: Push changes to the remote repository (master/main branch)
git push origin main

:: If you have a different branch, replace 'main' with your branch name
:: Example: git push origin <your-branch-name>

echo File uploaded without history, and changes pushed to the repository!
pause
