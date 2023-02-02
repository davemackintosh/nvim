local M = {}

local lightText = "#FFFFFF"
local darkText = "#000000"

local filetypeToColorMap = {
	lua = { "#f2cdcd", darkText },
	default = { "", lightText },
	go = { "#cba6f7", darkText },
	typescript = { "#f38ba8", darkText },
	typescriptreact = { "#f38ba8", darkText },
	javascript = { "#f38ba8", darkText },
	javascriptreact = { "#f38ba8", darkText },
	swift = { "#74c7ec", darkText },
	c = { "#a6e3a1", darkText },
	cpp = { "#a6e3a1", darkText },
	bash = { "#a6e3a1", darkText },
	python = { "#b4befe", darkText },
}

local function get_filetype_color()
	local filetype = vim.bo.filetype
	local color = filetypeToColorMap[filetype] or filetypeToColorMap["default"]
	return color
end

function M.colorize_msg_area()
	local color = get_filetype_color()
	if not color then
		return
	end

	if color[1] ~= "" then
		vim.cmd(string.format("hi MsgArea guibg=%s", color[1]))
	end

	if color[2] ~= "" then
		vim.cmd(string.format("hi MsgArea guifg=%s", color[2]))
	end
end

return M
