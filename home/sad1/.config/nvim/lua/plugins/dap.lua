local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

-- dap.adapters.codelldb = {
-- 	type = 'server',
-- 	port = "${port}",
-- 	executable = {
-- 		command = '/home/sad1/.local/share/nvim/mason/bin/codelldb',
-- 		args = { "--port", "${port}" },
-- 		-- On windows you may have to uncomment this:
-- 		-- detached = false,
-- 	}
-- }

-- require('dap-python').setup('/home/sad1/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
-- dap.configurations.python = {
-- 	{
-- 		type = 'python',
-- 		request = 'launch',
-- 		name = "Launch file",
-- 		program = "${file}",
-- 		pythonPath = function()
-- 			return '/usr/bin/python'
-- 		end,
-- 	},
-- }

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}

dap.adapters.gdb = {
	id = 'gdb',
	type = 'executable',
	command = 'gdb',
	args = { '--quiet', '--interpreter=dap' },
}

dap.configurations.c = {
	{
		name = 'Run executable (GDB)',
		type = 'gdb',
		request = 'launch',
		program = function()
			-- This requires special handling of 'run_last', see
			-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
			local path = vim.fn.input({
				prompt = 'Path to executable: ',
				default = vim.fn.getcwd() .. '/',
				completion = 'file',
			})

			return (path and path ~= '') and path or dap.ABORT
		end,
	},
	{
		name = 'Run executable with arguments (GDB)',
		type = 'gdb',
		request = 'launch',
		-- This requires special handling of 'run_last', see
		-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
		program = function()
			local path = vim.fn.input({
				prompt = 'Path to executable: ',
				default = vim.fn.getcwd() .. '/',
				completion = 'file',
			})

			return (path and path ~= '') and path or dap.ABORT
		end,
		args = function()
			local args_str = vim.fn.input({
				prompt = 'Arguments: ',
			})
			return vim.split(args_str, ' +')
		end,
	},
	{
		name = 'Attach to process (GDB)',
		type = 'gdb',
		request = 'attach',
		processId = require('dap.utils').pick_process,
	},

}


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
	function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)
