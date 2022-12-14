vim.cmd [[packadd packer.nvim]]

-- automatically run PackerSync when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer itself
  use 'folke/tokyonight.nvim' -- theme
  use 'nvim-tree/nvim-web-devicons' -- icons

  use "nvim-lua/plenary.nvim" -- general functions, common dependency
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            -- your configuration comes here
        }
    end
  }

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- formatters and linters

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'

  use 'akinsho/toggleterm.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
end)

