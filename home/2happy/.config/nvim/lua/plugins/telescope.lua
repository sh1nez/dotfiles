local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gq', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

require('telescope').setup {
	defaults = {
		-- layout_strategy = "cursor",
		layout_config = {
			width = 0.999,
			height = 0.999,
			preview_width = 0.5,
			prompt_position = 'bottom',
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
}

vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lw', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', { noremap = true, silent = true })
