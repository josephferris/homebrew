# Homebrew

Homebrew setup and configuration using dotfiles for macOS managed with GNU stow

## Installation

### Brew

`brew.sh` automatically detects if homebrew is installed and if it isn't, installs it - afterwards it installs all applications specified in `Brewfile`. One nice bonus of managing things this way is you can `brew install` additional apps and then run `brew bundle dump` to generate or update your `Brewfile`.

### GNU Stow

The actual config files for most applications are managed with [GNU Stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) which is installed by homebrew. Assuming you cloned the dotfiles directory into your home directory, run `stow bash`, for example, from `~/dotfiles` to create symlinks of all files within that directory to their expected locations in your home directory. It's a little weird at first but it's totally worth it.

## TODO

- document vim/vim-plug
- document stow, automate deplying dotfiles with stow
- support for gruvbox and other themes
- linux support
