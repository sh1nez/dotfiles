local function execute_command(com)
    vim.cmd(":w")
    vim.cmd(":FloatermNew!" .. com)
end

function run_or_compile(file)
    local file_extension = file:match(".*%.(.*)")
	if not file_extension then
		vim.cmd(":w")
		return
	end
    if file_extension == "cpp" or file_extension == "c" then
        execute_command("gcc -o " .. file:match("(.*)%..*") .. " " .. file .. " && ./" .. file:match("(.*)%..*"))
    elseif file_extension == "py" then
        execute_command("python3 " .. file)
    elseif file_extension == "lua" then
        execute_command("lua " .. file)
    elseif file_extension == "sh" then
        execute_command("bash " .. file)
    else
        vim.cmd(":w")
        vim.cmd('echo "Unsupported file type: ' .. file_extension .. '"')
    end
end

-- Задаем бинд для выполнения функции при нажатии <leader>r
vim.api.nvim_set_keymap('n', '<leader>r', [[:lua run_or_compile(vim.fn.expand("%:p"))<CR>]], { noremap = true, silent = true })

