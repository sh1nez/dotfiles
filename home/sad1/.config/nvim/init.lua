require("core.plugins")
require("core.mappings")
require("core.options")

require("core.colors")


require("plugins.neotree")
require("plugins.treesitter")


require("plugins.comment")
require("plugins.lsp")
require("plugins.cmp")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
require("plugins.telescope")

require("plugins.floaterm")

require("luasnip.loaders.from_snipmate").load({ include = { "c", "cpp", 'python' } })
