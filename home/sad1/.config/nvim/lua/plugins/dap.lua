local dap = require('dap')
local dapui = require("dapui")

require("neodev").setup({
	library = {
		enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
		-- these settings will be used for your Neovim config directory
		runtime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		plugins = { "nvim-dap-ui" },
	},
	setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
	-- for your Neovim config directory, the config.library settings will be used as is
	-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
	-- for any other directory, config.library.enabled will be set to false
	override = function(root_dir, options) end,
	-- With lspconfig, Neodev will automatically setup your lua-language-server
	-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
	-- in your lsp start options
	lspconfig = true,
	-- much faster, but needs a recent built of lua-language-server
	-- needs lua-language-server >= 3.6.0
	pathStrict = true,
	types = true
})

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '/home/sad1/.local/share/nvim/mason/bin/codelldb',
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	}
}

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

dap.configurations.asm = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = vim.fn.expand("%:p:r"),
		-- program = function()
		--   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		-- end,
		cwd = '${workspaceFolder}',
		stopOnEntry = true,
	}
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = vim.fn.expand("%:p:r"),
		-- program = vim.fn.expand("%:p:r"),
		-- program = function()
		-- 	return vim.fn.input('Path toooooo executable: ', vim.fn.getcwd() .. '/', 'file')
		-- end,
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

local table = {
	{
		name = 'Run executable (GDB)',
		type = 'gdb',
		request = 'launch',
		program = vim.fn.expand("%:p:r"),
		-- program = function()
		-- 	local path = vim.fn.input({
		-- 		prompt = 'Path to executable: ',
		-- 		default = vim.fn.getcwd() .. '/',
		-- 		completion = 'file',
		-- 	})
		-- 	return (path and path ~= '') and path or dap.ABORT
		-- end,
	},
	{
		name = 'Run executable with arguments (GDB)',
		type = 'gdb',
		request = 'launch',
		program = vim.fn.expand("%:p:r"),
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

dap.configurations.c = table


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

dapui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.60
		}, {
			id = "breakpoints",
			size = 0.30
		}, {
			id = "stacks",
			size = 0.10
		},
			-- {
			-- 	id = "watches",
			-- 	size = 0.25
			-- }
		},
		position = "left",
		size = 40
	},
		{
			elements = {
				-- 	{
				-- 	id = "repl",
				-- 	size = 1
				-- },
				{
					id = "console",
					size = 1
				}
			},
			position = "bottom",
			size = 10
		}
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
