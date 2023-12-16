require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "pylsp"},
})

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {}
lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.asm_lsp.setup{
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern('settings.json');
}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>ga', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>gr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>gl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>G', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>gn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>fr', function()
      vim.lsp.buf.format { async = true }
    end, opts)
   end,
})

-- vim.g['clang_format#code_style'] = 'llvm'
-- vim.g['clang_format#auto_format'] = 0
-- -- vim.g['clang_format#auto_format_on_insert_leave'] = 1
--
-- vim.g['clang_format#style_options'] = {
--     AccessModifierOffset = -4,
--     AlignConsecutiveMacros = {
--         Enabled = true,
--     },
--     AlignConsecutiveAssignments = {
--         Enabled = false,
--     },
--     AllowAllParametersOfDeclarationOnNextLine = false,
--     AllowShortEnumsOnASingleLine = false,
--     AllowShortFunctionsOnASingleLine = 'Inline',
--     AllowShortIfStatementsOnASingleLine = false,
--     AllowShortLambdasOnASingleLine = 'Inline',
--     AlwaysBreakTemplateDeclarations = true,
--     BinPackArguments = false,
--     BinPackParameters = false,
--     BreakBeforeBraces = 'Custom',
--     BraceWrapping = {
--         AfterClass = false,
--         BeforeLambdaBody = true,
--     },
--     ConstructorInitializerIndentWidth = 4,
--     Cpp11BracedListStyle = true,
--     IndentExternBlock = 'Indent',
--     IndentPPDirectives = 'None',
--     IndentRequiresClause = false,
--     IndentWidth = 4,
--     LambdaBodyIndentation = 'OuterScope',
--     NamespaceIndentation = 'All',
--     PackConstructorInitializers = 'NextLine',
--     ReflowComments = true,
--     RequiresClausePosition = 'WithPreceding',
--     SpaceAfterTemplateKeyword = true,
--     SpaceBeforeCpp11BracedList = false,
--     SpaceBeforeCtorInitializerColon = false,
--     SpaceBeforeInheritanceColon = false,
--     SpaceBeforeRangeBasedForLoopColon = false,
-- }
--
