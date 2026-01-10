local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  -- telescope
  'nvim-lua/plenary.nvim';
  { 
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    requires = {
      'nvim-lua/plenary.nvim', 
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
    }
  };

  -- harpoon 
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { "nvim-lua/plenary.nvim" }
  };

  -- yazi/file management
  {
    "mikavilpas/yazi.nvim",
    version = '*',
    requires = {
      "nvim-lua/plenary.nvim"
    }
  };

  -- dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        shortcut_type = 'number'
      }
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  };

  -- terminal
  {
    "akinsho/toggleterm.nvim", 
    tag = 'v2.13.1' };
   -- lsp pkgs
  'mason-org/mason.nvim';
  'mason-org/mason-lspconfig.nvim';
  "neovim/nvim-lspconfig";
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';

  -- color scheme
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    priority = 1000,
    opts = {}
  };

  -- comments
  'numToStr/Comment.nvim';

  -- ai/autocomplete
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end
  };

  -- formatting
  'stevearc/conform.nvim';
}
