vim.o.swapfile = false
-- vim.api.nvim_exec([[set number relativenumber]], true)
vim.opt.number = true
vim.opt.relativenumber = false


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.bo.fixendofline = false
    vim.bo.eol = true
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("[cro]", "")
  end
})

vim.opt.expandtab = true; -- разделение пробелами
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoindent = true
