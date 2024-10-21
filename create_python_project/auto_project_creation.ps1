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

# --- Functions ---
function Clear-Console {
  $cursorY  = $Host.UI.RawUI.CursorPosition.Y
  $cursorX  = $Host.UI.RawUI.CursorPosition.X

  [console]::SetCursorPosition($cursorX, $cursorY)
}

function Read-Host-Color {
  param(
    [string]$message
  )

  $input = $(Write-Host $message -ForegroundColor Blue -NoNewLine; Read-Host)

  return $input
}

# --- Script Start ---
# 1 - Setup Project Directory
Write-Host -ForegroundColor White "Creating the Project folder..."
$projectName = Read-Host-Color "   Enter the Project Name: "
$inCurrentDir = Read-Host-Color "   Create in the current directory? (y/n) "

if ($inCurrentDir -ne "y") {
  $projectPath = Read-Host-Color "   | Enter the Project Path: "
  
  Write-Host -ForegroundColor Blue "   | Moving to the Project Path..."
  cd $projectPath
}

Write-Host -ForegroundColor Blue "   Creating the Project folder..."
mkdir $projectName

cd $projectName

Write-Host "`r`n`r`nPress any key to continue..."; Read-Host

Clear-Console # Not working


# 2 - Initialize Git
Write-Host -ForegroundColor White "Setting up Version Control..."
$isInitGit = Read-Host-Color "   Initialize Git? (y/n) "


# if ($isInitGit -eq "y") {
#   git init

#   #gh auth status

#   Write-Host "The current Active GitHub Account is: "
#   gh auth status -a

#   ## Login to Account
#   $isNewLogin = Read-Host "Login to a different Account? (y/n)"

#   if ($isNewLogin -eq "y") {
#       Write-Host "Logging in to a different Account"
#       gh auth login
#   } else {
#       $isSwitchAccount = Read-Host "Switch Account? (y/n)"
#       if ($isSwitchAccount -eq "y") {
#           Write-Host "Switching Account..."
#           $gitAccount = Read-Host "Enter GitHub Account Name: ..."
#           gh auth switch -u $gitAccount
#       }
#   }

#   gh repo create my_project --public --source=.

#   git add .
#   git commit -m "Initial Commit"
#   git push origin
# }
