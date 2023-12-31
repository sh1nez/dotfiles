local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/home/sad1/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

lua require('dap-python').setup('/home/sad1/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
          return '/usr/bin/python'
        end;
      },
}

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


 vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
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


-- -- dap.defaults.fallback.external_terminal = {
-- -- 	command = '/usr/bin/alacritty';
--     args = {'-e'};
--   }
--
--
-- --dap.listeners.before['event_terminated']['my-plugin'] = function(session, body)
--     print('Session terminated', vim.inspect(session), vim.inspect(body))
--   end
-- local dap = require('dap')
-- dap.defaults.fallback.force_external_terminal = true
-- local widgets = require('dap.ui.widgets')
--   local my_sidebar = widgets.sidebar(widgets.scopes)
--   my_sidebar.open()
-- <
--
-- View the current frames in a sidebar:
--
-- >lua
--   local widgets = require('dap.ui.widgets')
--   local my_sidebar = widgets.sidebar(widgets.frames)
--   my_sidebar.open()
-- <
--
--
-- View the current scopes in a centered floating window:
--
-- >lua
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- <
--
--
-- View the value for the expression under the cursor in a floating window:
--
-- >lua
--   require('dap.ui.widgets').hover()
-- <
--
