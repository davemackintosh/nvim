local M = {}
-- Convert the output of some xmake commands into a table
-- @return table
function M.getXMakeInfoAsTable()
	local xmakeInfoTable = {
		version = "",
		host = "",
		programdir = "",
		programfile = "",
		globaldir = "",
		tmpdir = "",
		workingdir = "",
		packagedir = "",
		packagedir_cache = "",
	}

	local xmakeInfo = vim.fn.system("xmake show")
	local xmakeInfoLines = vim.split(xmakeInfo, "\n")

	for _, line in pairs(xmakeInfoLines) do
		line = string.gsub(line, "[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
		local key, value = string.match(line, "([%w_]+):%s*(.*)")

		if key ~= nil then
			xmakeInfoTable[key] = value
		end
	end

	local xmakeTargets = vim.fn.system("xmake show -l targets")
	local xmakeTargets = vim.split(xmakeTargets, " ")

	return xmakeInfoTable, xmakeTargets
end

return M
