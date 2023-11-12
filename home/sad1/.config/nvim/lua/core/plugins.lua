local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- "nvim-tree/nvim-tree.lua",
{"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    	},
},
{'nvim-treesitter/nvim-treesitter'},
{'neovim/nvim-lspconfig'},
{'joshdick/onedark.vim'},
{'olimorris/onedarkpro.nvim'},

{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/cmp-buffer'},
{'hrsh7th/cmp-path'},
{'hrsh7th/cmp-cmdline'},
{'hrsh7th/nvim-cmp'},
{'nvim-telescope/telescope.nvim', 
	branch = '0.1.x',
      	dependencies = { 'nvim-lua/plenary.nvim' }
},
{'terrortylor/nvim-comment'},
{'mfussenegger/nvim-dap'},
-- {'erietz/vim-terminator'},
{'voldikss/vim-floaterm'},
-- {'thinca/vim-quickrun'},
-- {'jpalardy/vim-slime'},

})
-- vim.opt.termguicolors = true
