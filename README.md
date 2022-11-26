# My Neovim Config
This repo contains my current neovim config. I don't recommend anybody pull and run this, instead use it as a template or a reference for your own config.

## Installation Notes
Below are some scribblings for me to reference when setting up nvim on a new system. Might be redundant and or useless.

### Packer
The package manager of choice.

https://github.com/wbthomason/packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```

### Netrw
`:Ex` to open netrw
Create a file `%`
Create a directory `d`

### Keymap
Leader set to " " (space)

### Pleanary
A collection of helper functions
https://github.com/nvim-lua/plenary.nvim

### Telescope
Install `ripgrep` and `fd`

`nvim-treesitter` is a dependency

### Treesitter
Once installed run `:TSUpdate`. Might fail first try.
Install parsers https://github.com/nvim-treesitter/nvim-treesitter#supported-languages

### LSP
install nvim_lspconfig

#### Typescript
`npm install -g typescript typescript-language-server`

