local M = {};
local Job = require'plenary.job';
local cmd = vim.api.nvim_exec;

local get_buf_info = function()
  local pos = vim.fn.winsaveview()
  local winnr = vim.fn.winnr()
  return winnr, pos
end
local set_buf_lines = function(bufnr, content)
  if type(content) == "string" then
    content = vim.split(content, "\n")
  end

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)
  local _, pos = get_buf_info()
  vim.fn.winrestview(pos)
end

M.run = function()
  local buflines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local args = {
		"--swiftversion",
		"5.4",
		"stdin",
		"--stdinpath",
    vim.api.nvim_buf_get_name(0),
  }

  local formatJob = Job:new({
    writer = table.concat(buflines, "\n"),
    command = "swiftformat",
    args = args,
    on_exit = vim.schedule_wrap(function(j, result)

      --- swiftformat return non-0 and that seems the only way to check for errors
			local stderr = j:stderr_result();
			vim.notify(table.concat(stderr, "\n"))
    end)
  })

  formatJob:sync();

	local new = formatJob:result();
	local bufnr = vim.api.nvim_get_current_buf();
	set_buf_lines(bufnr, new)
end

cmd("autocmd BufWritePost <buffer> :lua require 'plugin-configs.swiftformat'.run()", false)

return M
