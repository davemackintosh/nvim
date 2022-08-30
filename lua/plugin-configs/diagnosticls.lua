local swiftlint = require "diagnosticls-configs.linters.swiftlint"

local function on_attach(client)
	local swiftformat = require "plugin-configs.swiftformat"
	swiftformat.on_attach()
end

local dlsconfig = require "diagnosticls-configs"

dlsconfig.init {
	on_attach = on_attach,
	format = true,
}

dlsconfig.setup {
	swift = {
		linter = swiftlint,
	},
}
