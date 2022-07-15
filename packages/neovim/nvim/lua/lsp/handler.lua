local M = {}

M.setup = function()
    local config = {
        virtual_text = false,
        signs = {
            active = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            source = "always",
            prefix = "",
            header = "",
        },
    }

    vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
    local opt = { noremap = true, silent = true }
    local lkey = vim.api.nvim_buf_set_keymap

    lkey(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)
    lkey(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
    lkey(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
    lkey(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt)
    lkey(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt)
    lkey(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opt)
    lkey(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opt)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
end

local success, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not success then
    vim.notify("Could not load cmp_nvim_lsp")
    return
end

local capabilties = vim.lsp.protocol.make_client_capabilities()
M.capabilties = cmp_nvim_lsp.update_capabilities(capabilties)

return M

