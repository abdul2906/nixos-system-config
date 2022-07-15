local colorscheme = "breezy"

function setup_colorscheme ()
    vim.o.background = "light";
--    require("gruvbox").setup({
--         contrast = "hard"
--    })
    vim.cmd("colorscheme " .. colorscheme)
end

local success, _ = pcall(setup_colorscheme)
if not success then
    vim.notify("Failed to setup colorscheme")
    return
end

