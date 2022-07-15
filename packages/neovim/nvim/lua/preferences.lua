local preferences = {
  tabstop = 4,                                                                 -- Set tab length to 4
  softtabstop = 4,                                                             -- Set tab to 4 spaces
  shiftwidth = 4,                                                              -- Indent by shifting by 4
  expandtab = true,                                                            -- Autoindent with spaces
  smartindent = true,                                                          -- Smart autoindent on new lines
  number = true,                                                               -- Display line numbers on the side
  errorbells = false,                                                          -- Disable the antichrist
  swapfile = false,                                                            -- Disable swapfiles while editing
  backup = false,                                                              -- Disable file backups
  undofile = true,                                                             -- Enable undofiles
  hidden = false,                                                              -- Disable hidden buffers
  mouse = "a",                                                                 -- Allow mouse usage
  scrolloff = 10,                                                              -- Amount of lines to pad while scrolling horizontally
  sidescrolloff = 10,                                                          -- Amount of lines to pad while scrolling vertically
  guicursor = "",                                                              -- Disable the guicorsor
  hlsearch = false,                                                            -- Disable highlights when searching
  termguicolors = true,                                                        -- Enable more colors, should work in most terminals
  incsearch = true,                                                            -- Search in realtime
  wrap = false,                                                                -- Disable line wrapping
  completeopt = { "menuone", "noselect", "noinsert" },                         -- Set completion options
  exrc = true,                                                                 -- Allow project specific rc
  fileencoding = "utf-8",                                                      -- Set file encoding to utf-8
  splitright = true,                                                           -- Force splits to the right side of the screen
  splitbelow = true,                                                           -- Force splits to the bottom of the screen
  relativenumber = false,                                                      -- Disable relative numbers
  clipboard = "unnamedplus",                                                   -- Use system clipboard
  smartcase = true,                                                            -- Smartindent but for lower/upper case
  conceallevel = 0,                                                            -- Markdown stuff
  showmode = false,                                                            -- Don't show the current mode
  timeoutlen = 500,                                                            -- Timeout for shortcut sequences
}

vim.opt.shortmess:append "c"

for option, value in pairs(preferences) do
  vim.opt[option] = value
end

