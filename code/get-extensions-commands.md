#linux
code --list-extensions | xargs -L 1 echo code --install-extension
#Windows (PowerShell, e. g. using Visual Studio Code's integrated Terminal):
code --list-extensions | % { "code --install-extension $_" }
