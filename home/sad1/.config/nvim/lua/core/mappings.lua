vim.g.mapleader = " "

vim.keymap.set('n', '<leader>t', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
