require("core.plugins")
require("core.mappings")
require("core.options")

require("core.colors")


require("plugins.neotree")
require("plugins.treesitter")


require("plugins.comment")
require("plugins.lsp")
require("plugins.cmp")
-- require('plugins.dap')
require("plugins.telescope")

require("plugins.floaterm")
require("luasnip.loaders.from_snipmate").load({ include = { "c", "cpp", 'python' } })
require("nvim-surround").setup()

require("plugins.shiza")

-- require("ibl").setup({scope = { enabled = false;}})

-- Задаем пользовательские клавиатурные отображения для перемещения вверх и вниз
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })

