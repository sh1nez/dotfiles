vim.g.mapleader = " "


vim.keymap.set('n', '<leader>t', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

vim.keymap.set('n', '[', ':vertical resize +1<CR>')
vim.keymap.set('n', '[', ':vertical resize -1<CR>')
vim.keymap.set('n', '}', ':resize +1<CR>')
vim.keymap.set('n', '{', ':resize +1<CR>')
vim.keymap.set('n', '<leader>ww', ':w !doas tee %<CR>')


vim.opt.tabstop = 4        -- Ширина табуляции в 4 пробелов
vim.opt.softtabstop = 4    -- Величина отступа при использовании "soft" табуляции
vim.opt.shiftwidth = 4     -- Количество пробелов для каждого уровня отступа

vim.opt.autoindent = true  -- Включить автоматическое форматирование при вводе

vim.api.nvim_set_keymap('n', '<C-Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

