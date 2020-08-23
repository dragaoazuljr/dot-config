$result = wsl cat ./instaled-extensions.md
$result = $result -split "`r`n"
ForEach ($line in $result){
    Invoke-Expression $line
}