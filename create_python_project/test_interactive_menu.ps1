
function Show-Menu{
  param(
    [string[]]$menuItems,
    [int]$resetCursorPositionX,
    [int]$resetCursorPositionY
  )

  $optionsCount = $menuItems.Length
  $currentSelection = 0

  function Display-Menu{
    [console]::SetCursorPosition($resetCursorPositionX, $resetCursorPositionY)

    for($i=0; $i -lt $menuItems.Length; $i++){
      if($i -eq $currentSelection){
        Write-Host -ForegroundColor Blue "-> $($i+1). $($menuItems[$i])"
      } else {
        Write-Host -ForegroundColor White "   $($i+1). $($menuItems[$i])"
      }
    }

    $cursorLeft2 = [System.Console]::CursorLeft
    $cursorTop2 = [System.Console]::CursorTop
    $CurrentLine2  = $Host.UI.RawUI.CursorPosition.Y

    Write-Host "Left Cursor: $cursorLeft2"
    Write-Host "Top Cursor: $cursorTop2"
    Write-Host "Current Line Cursor: $CurrentLine2"
  }

  [System.Console]::CursorVisible = $false
  Display-Menu

  while($true){
    $key = [System.Console]::ReadKey($true).Key

    switch($key){
      "UpArrow" {
        $currentSelection = if ($currentSelection -eq 0) { $optionsCount - 1 } else { $currentSelection - 1 }
      }
      "DownArrow" {
        $currentSelection = if ($currentSelection -eq ($optionsCount - 1)) { 0 } else { $currentSelection + 1 }
      }
      "Enter" {
        [System.Console]::CursorVisible = $true
        return $currentSelection
      }
    }

    Display-Menu
  }
}

$cursorLeft = [System.Console]::CursorLeft
$cursorTop = [System.Console]::CursorTop
$CurrentLine  = $Host.UI.RawUI.CursorPosition.Y

Write-Host "Left Cursor: $cursorLeft"
Write-Host "Top Cursor: $cursorTop"
Write-Host "Current Line Cursor: $CurrentLine"

$menuItems = @(
  "Setup Project Directory",
  "Initialize Git",
  "Create README.md",
  "Create .gitignore for Python",
  "Create a virtual environment",
  "Activate the virtual environment",
  "Create an empty requirements.txt",
  "Open the project in VSCode"
)

Show-Menu `
  -menuItems $menuItems `
  -resetCursorPositionX $cursorLeft `
  -resetCursorPositionY $cursorTop