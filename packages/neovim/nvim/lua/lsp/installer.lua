local success, lsp_installer = pcall(require, "nvim-lsp-installer")
if not success then
    vim.notify("Failed to launch lsp installer")
    return
end

lsp_installer.on_server_ready(function(server)
    local opt = {
        on_attach = require("lsp.handler").on_attach,
        capabilities = require("lsp.handler").capabilities,
    }

    local servers = {
        ["jsonls"] = function()
            local jsonls_opt = require("lsp.settings.jsonls")
            opt = vim.tbl_deep_extend("force", jsonls_opt, opt)
        end,
        ["sumneko_lua"] = function()
            local sumneko_lua_opt = require("lsp.settings.sumneko_lua")
            opt = vim.tbl_deep_extend("force", sumneko_lua_opt, opt)
        end,
    }

   pcall(servers[server.name], nil)

    server:setup(opt)
end)

