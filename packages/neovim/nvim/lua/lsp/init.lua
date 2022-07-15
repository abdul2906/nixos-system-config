local success, _ = pcall(require, "lspconfig")
if not success then
    vim.notify("Could not start lsp")
    return
end

require("lsp.installer")
require("lsp.handler").setup()

