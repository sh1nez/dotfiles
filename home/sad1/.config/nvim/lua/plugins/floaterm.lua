local function execute_command(com)
    vim.cmd(":w")
    vim.cmd(":FloatermNew! " .. com)
end

local switch_cases = {
    cpp = function(file)
    -- vilocal file_directory = vim.fn.expand("%:h")   
	    local file_directory = vim.fn.fnamemodify(file, ":h")
        local file_name = vim.fn.expand("%:t:r")
        execute_command("cd " .. file_directory .. " && clang++ " .. file .. ' -o ' .. file_name .. ' && "' .. file_directory .. '/' .. file_name .. '"')
	--	execute_command("cd " .. vim.fn.expand("%:h") .. " clang++ -o " .. vim.fn.expand("%:h"):match("(.*)%..*") .. " " .. file .. " && . " .. file:match("(.*)%..*"))

    --    execute_command("cd " .. file_directory .. " && clang++ -o " .. file:match("(.*)%..*") .. " " .. file)
    end,

    c = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
        local file_name = vim.fn.expand("%:t:r")
        execute_command("cd " .. file_directory .. " && clang" .. file .. ' -o ' .. file_name .. ' && "' .. file_directory .. '/' .. file_name .. '"')

    end,
    py = function(file)
        execute_command("python3 " .. file)
    end,
    lua = function(file)
        execute_command("lua " .. file)
    end,
    sh = function(file)
        execute_command("bash " .. file)
    end,
    default = function(file)
        vim.cmd(":w")
        vim.cmd('echo "Unsupported file type: ' .. file_extension .. '"')
    end,
}

function run_or_compile(file)
    local file_extension = file:match(".*%.(.*)")
    if not file_extension then
        vim.cmd(":w")
        return
    end
    (switch_cases[file_extension] or switch_cases.default)(file)
end
vim.keymap.set('n', '<leader>rt', ':FloatermNew<CR>')
vim.api.nvim_set_keymap('n', '<leader>rr', [[:lua run_or_compile(vim.fn.expand("%:p"))<CR>]], { noremap = true, silent = true })

