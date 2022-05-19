local swiftlint = require 'diagnosticls-configs.linters.swiftlint'

local function on_attach(client)
  vim.notify('Attached to ' .. client.name)
end

local dlsconfig = require 'diagnosticls-configs'

dlsconfig.init {
  on_attach = on_attach,
	format = true,
}

dlsconfig.setup {
  swift = {
    linter = swiftlint,
  },
}

require "plugin-configs.swiftformat"
