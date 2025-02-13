require("core.plugins")
require("core.mappings")
require("core.options")

require("core.colors")


require("plugins.neotree")
require("plugins.treesitter")


require("plugins.comment")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.telescope")

require("plugins.floaterm")
-- require("luasnip.loaders.from_vscode").lazy_load({ include = { "c", "cpp", 'python' }, path = { "./snippets" } })
require("luasnip.loaders.from_snipmate").lazy_load()
require("nvim-surround").setup()

require("plugins.shiza")
require('plugins.lualine')


-- Задаем пользовательские клавиатурные отображения для перемещения вверх и вниз
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })
require("plugins.hex")

require("plugins.dap")
require("plugins.docker")
require("plugins.markdown")
require("plugins.java")
require("plugins.myplugin")

