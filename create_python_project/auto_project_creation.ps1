## This is a script that automates the project creation

# App Flow - OLD FLOW
# 1 - Move to the Target
# 2 - Create the Project
# 3 - Initialize Git
# 4 - Create the README.md
# 5 - Create the .gitignore for python
# 6 - Create a virtual environment
# 7 - Activate the virtual environment
# 8 - Create an empty requirements.txt
# 9 - Open the project in VSCode

# --- Script Start ---
# 1 - Setup Project Directory
$projectName = Read-Host "Enter the Project Name: "

$inCurrentDir = Read-Host "Create in the current directory? (y/n)"
if ($inCurrentDir -ne "y") {
  $projectPath = Read-Host "Enter the Project Path: "
  
  Write-Host "Moving to the Project Path..."
  cd $projectPath
}

Write-Host "Creating the Project folder..."
mkdir $projectName

cd $projectName


# 2 - Initialize Git
$isInitGit = Read-Host "Initialize Git? (y/n)"
if ($isInitGit -eq "y") {
  git init

  #gh auth status

  Write-Host "The current Active GitHub Account is: "
  gh auth status -a

  ## Login to Account
  $isNewLogin = Read-Host "Login to a different Account? (y/n)"

  if ($isNewLogin -eq "y") {
      Write-Host "Logging in to a different Account"
      gh auth login
  } else {
      $isSwitchAccount = Read-Host "Switch Account? (y/n)"
      if ($isSwitchAccount -eq "y") {
          Write-Host "Switching Account..."
          $gitAccount = Read-Host "Enter GitHub Account Name: ..."
          gh auth switch -u $gitAccount
      }
  }

  gh repo create my_project --public --source=.

  git add .
  git commit -m "Initial Commit"
  git push origin
}
