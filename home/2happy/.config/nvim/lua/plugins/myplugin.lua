return {
	{
		"nvim-inspector",
		config = function()
			vim.api.nvim_create_user_command("AnalyzeCode", function()
				local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins/nvim-inspector/main"
				vim.fn.jobstart(plugin_path, {
					on_stdout = function(_, data)
						if data then
							for _, line in ipairs(data) do
								print(line)
							end
						end
					end,
					on_stderr = function(_, data)
						if data then
							for _, line in ipairs(data) do
								vim.api.nvim_err_writeln(line)
							end
						end
					end,
					on_exit = function(_, code)
						if code ~= 0 then
							vim.api.nvim_err_writeln("myplugin завершился с ошибкой: " .. code)
						end
					end,
				})
			end, {})
		end,
	},
}
