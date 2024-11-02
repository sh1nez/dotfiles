local function execute_command(comman)
	vim.cmd(":w")
	vim.cmd(":FloatermNew! " .. comman)
end

local switch_cases = {
	cpp = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		local file_name = vim.fn.expand("%:t:r")
		-- vilocal file_directory = vim.fn.expand("%:h")
		local flags = " -Wall -Wpedantic -Wextra -fsanitize=undefined -g "
		execute_command("cd " ..
			file_directory .. " && g++ " .. flags .. file .. ' -o ' .. file_name .. ' && time ./' .. file_name)
	end,

	c = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		local file_name = vim.fn.expand("%:t:r")
		local flags = " -Wall -Wpedantic -Wextra -fsanitize=undefined -g "
		execute_command("cd " ..
			file_directory .. " && gcc" .. flags .. file .. ' -o ' .. file_name .. ' && time ./' .. file_name)
	end,
	py = function(file)
		execute_command("time python3 " .. file)
	end,
	lua = function(file)
		execute_command("time lua " .. file)
	end,
	sh = function(file) execute_command("time bash " .. file) end,
	asm = function(file)
		execute_command("cd " ..
			file_directory ..
			" && nasm -f elf64 " ..
			file ..
			' -o ' ..
			file_name ..
			'.o' ..
			' && ' .. 'ld -m elf_x86_64 -o ' .. file_name .. ' ' .. file_name .. '.o' .. ' && time ./' .. file_name)
	end,
	s = function(file)
		execute_command("cd " ..
			vim.fn.fnamemodify(file, ":h") ..
			" && as " ..
			file ..
			' -o ' ..
			file_name .. '.o' .. " && ld " .. file_name .. '.o' .. " -o " .. file_name .. " && time ./" .. file_name)
	end,

	zig = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		local file_name = vim.fn.expand("%:t:r")
		-- execute_command("cd " .. file_directory .. " && gcc" .. file .. ' -o ' .. file_name .. ' && time ./' .. file_name)
		execute_command("cd " .. file_directory .. " && zig run " .. file_name .. ".zig")
	end,

	rs = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		execute_command("cd " .. file_directory .. " && cargo run")
	end,
	js = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		local file_name = vim.fn.expand("%:t:r")
		execute_command("cd " .. file_directory .. " && node " .. file_name)
	end,
	ts = function(file)
		local file_directory = vim.fn.fnamemodify(file, ":h")
		local file_name = vim.fn.expand("%:t:r")
		execute_command("cd " .. file_directory .. " && tsc " .. file .. " --outDir tmp &&" .. " cd tmp && node " .. file_name ..".js")
	end,


	default = function(_)
		vim.cmd(":w")
		vim.cmd('echo "Unsupported file type: "')
	end,
}

function run_or_compile(file)
	local file_extension = file:match(".*%.(.*)")
	if not file_extension then
		vim.cmd(":w")
		return
	else
		(switch_cases[file_extension] or switch_cases.default)(file)
	end
end

vim.keymap.set('n', '<leader>R', ':FloatermNew<CR>')

vim.api.nvim_set_keymap('n', '<leader>r', [[:lua run_or_compile(vim.fn.expand("%:p"))<CR>]],
	{ noremap = true, silent = true })

vim.g.floaterm_position = 'bottom'
vim.g.floaterm_direction = 'vertical'
vim.g.floaterm_width = 0.99
vim.g.floaterm_height = 0.5
vim.g.floaterm_border = 0
