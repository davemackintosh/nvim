local lsp_installer_servers = require "nvim-lsp-installer.servers"

local M = {}

function M.setup(servers, options)
  for server_name, _ in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)

    if server_available then
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
        server:setup(opts)
      end)

      if not server:is_installed() then
        print("Installing " .. server.name)
        server:install()
      end
    else
      print(server)
    end
  end
end

return M
