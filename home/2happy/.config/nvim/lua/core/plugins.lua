local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  { 'neovim/nvim-lspconfig' },
  { 'joshdick/onedark.vim' },
  { 'olimorris/onedarkpro.nvim' },

  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason-lspconfig.nvim' },
  { "williamboman/mason.nvim", },

  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp', }, --dependencies = { 'quangnguyen30192/cmp-nvim-ultisnips' } },

  { 'nvim-telescope/telescope.nvim',       lazy = true,        branch = '0.1.x',                      dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'terrortylor/nvim-comment' },
  { 'voldikss/vim-floaterm' },
  { 'eandrju/cellular-automaton.nvim',     event = "VeryLazy" },
  { 'jiangmiao/auto-pairs', },
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl",       opts = { scope = { enabled = false } } },

  { "L3MON4D3/LuaSnip",                    event = "VeryLazy", version = "v2.*",                      build = "make install_jsregexp",           dependencies = { "rafamadriz/friendly-snippets" }, },
  { 'saadparwaiz1/cmp_luasnip' },
  { "kylechui/nvim-surround",              event = "VeryLazy", version = "*", },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { 'RaafatTurki/hex.nvim',   event = "VeryLazy" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/neodev.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
  },
  { 'mfussenegger/nvim-jdtls' },
  {
    'nvimtools/none-ls.nvim',
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim"
    },
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources or {}, {
        require("none-ls.diagnostics.eslint_d"),
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "rhysd/git-messenger.vim",
    event = "BufRead",
    config = function()
      -- Автоматическое закрытие попапа при выходе из строки
      vim.g.git_messenger_floating_win_opts = { border = "rounded" }
      vim.g.git_messenger_always_into_popup = true
      vim.keymap.set("n", "<leader>gm", "<Cmd>GitMessenger<CR>", { desc = "Show line blame" })
    end,
  }

}
)
