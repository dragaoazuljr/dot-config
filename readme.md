# Dotfiles config
This is a repository of my personal dot file configurations for IDEs such as vscode and neovim, as well as some useful scripts

## Neovim
This neovim configuration is based heavily on a YouTube video by @devaslive (https://youtu.be/ajmK0ZNcM4Q).

Before starting neovim, run nvim/install-dependencies.sh to install all node dependencies.

### FauxPilot
This nvim config uses two forked repositories, FauxPilot and Copilot.vim, and changes them to work locally instead of calling Github servers. To make this work, clone the [dragaoazuljr/fauxpilot](https://github.com/dragaoazuljr/fauxpilot) repository, and then run `{fauxpilot-folder}/setup.sh` (requires Docker) to configure fauxpilot and download the necessary models. After that, just run `{fauxpilot-folder}/launch.sh` to start a Docker compose with the AI model loaded.

### Copilot.vim
For this package, the endpoint that the plugin calls has been changed to go to FauxPilot instead of Github Copilot servers. The plugin still has all the telemetry, and disabling it is not yet possible.

This will be installed with `:PackerInstall` command.

## VScode
To install extensions listed on instaled-extensions.md, run `code/install-extensions.sh`. Commands to extract currently installed extensions are available in the `get-extensions-commands.md` file.
