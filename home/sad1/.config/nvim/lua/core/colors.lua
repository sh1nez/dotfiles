vim.opt.termguicolors = true

function SetColor(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

end
SetColor()
