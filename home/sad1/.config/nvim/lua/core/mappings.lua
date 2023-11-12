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

-- Настройка биндов
vim.api.nvim_set_keymap('t', '<Space>q', '<C-\\><C-n>', { noremap = true, silent = true })

-- Установка отступов
vim.opt.tabstop = 4        -- Ширина табуляции в 5 пробелов
vim.opt.softtabstop = 4    -- Величина отступа при использовании "soft" табуляции
vim.opt.shiftwidth = 4     -- Количество пробелов для каждого уровня отступа
-- vim.opt.expandtab = true   -- Преобразовывать табуляцию в пробелы

vim.opt.autoindent = true  -- Включить автоматическое форматирование при вводе
-- vim.opt('smartindent', true) -- Включить умное форматирование
-- vim.opt('smarttab', true)    -- Использовать умные табуляции
-- vim.opy('cindent', true)     -- Включить С-подобное форматирование

