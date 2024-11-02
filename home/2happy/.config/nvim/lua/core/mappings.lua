vim.g.mapleader = " "

vim.keymap.set('i', '<C-q>', '<Esc>')
vim.keymap.set('n', '<leader>t', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.g.AutoPairsMapCh = 0

vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>hh', { noremap = true, silent = true }) vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>jj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>kk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>ll', { noremap = true, silent = true })
vim.keymap.set('n', '+', ':vsplit<CR>')
vim.keymap.set('n', '_', ':split<CR>')
vim.keymap.set('n', '=', ':bnext<CR>')
vim.keymap.set('n', '-', ':bprev<CR>')

vim.keymap.set('n', '<leader>L', ':vertical resize +13<CR>')
vim.keymap.set('n', '<leader>H', ':vertical resize -13<CR>')
vim.keymap.set('n', '<leader>K', ':resize +10<CR>')
vim.keymap.set('n', '<leader>J', ':resize -10<CR>')
vim.keymap.set('n', '<leader>ww', ':w !doas tee %<CR>')

vim.opt.expandtab = false;  -- разделение пробелами
vim.opt.tabstop = 4        -- Ширина табуляции в 4 пробелов
vim.opt.softtabstop = 4    -- Величина отступа при использовании "soft" табуляции
vim.opt.shiftwidth = 4     -- Количество пробелов для каждого уровня отступа

vim.opt.autoindent = true  -- Включить автоматическое форматирование при вводе

vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', { noremap = true, silent = true })
