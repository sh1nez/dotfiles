require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "pylsp", "bashls", "zls", "rust_analyzer", "html", "ts_ls", "emmet_ls", "cssls", "intelephense", "dockerls", "gopls", "jdtls", "hls", "jsonls" }, }
)

local lspconfig = require('lspconfig')

lspconfig.jsonls.setup {}

lspconfig.hls.setup {}

lspconfig.jdtls.setup {}

lspconfig.gopls.setup {}

lspconfig.ts_ls.setup {  }

lspconfig.intelephense.setup {}

lspconfig.html.setup {
	cmd = { "/usr/bin/vscode-html-language-server", "--stdio" },
}
lspconfig.cssls.setup {
	cmd = { "/usr/bin/vscode-css-language-server", "--stdio" },
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.nginx_language_server.setup {}
lspconfig.bashls.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.zls.setup {}
lspconfig.pylsp.setup {}
lspconfig.lua_ls.setup {}
lspconfig.cmake.setup {}
lspconfig.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			procMacro = {
				enable = true, -- Включаем поддержку процедурных макросов
			},
			cargo = {
				loadOutDirsFromCheck = true, -- Это может помочь в улучшении подсказок для макросов, особенно для макросов, связанных с `build.rs`
			},
		}
	}
}
lspconfig.clangd.setup {
	on_attach = on_attach,
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true
	},
	filetypes = { "c", "cpp", "h", "hpp" },
	root_dir = lspconfig.util.root_pattern('.git', 'compile_commands.json', '.clangd', '.clang-tidy', '.clang-format', 'compile_flags.txt', 'configure.ac', '.git'),
}

lspconfig.asm_lsp.setup {
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern('settings.json'),
	filetypes = { "asm", "S" },
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

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.env",
  callback = function()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
  end,
})
