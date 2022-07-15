local key = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Set the leader key
key("", "<Space>", "<Nop>", opt)
vim.g.mapleader = " "

-- Toggle left hand explorer
key("n", "<leader>e", ":Lex 10<cr>", opt)

-- Resize current buffer
key("n", "<C-Up>", ":resize -2<cr>", opt)
key("n", "<C-Down>", ":resize +2<cr>", opt)
key("n", "<C-Left>", ":vertical resize -2<cr>", opt)
key("n", "<C-Right>", ":vertical resize +2<cr>", opt)

-- Switch between buffers
key("n", "<S-h>", ":bprevious<cr>", opt)
key("n", "<S-l>", ":bnext<cr>", opt)

-- Better indent
key("v", "<", "<gv", opt)
key("v", ">", ">gv", opt)

-- Move text
key("v", "<A-j>", ":m .+1<cr>==", opt)
key("v", "<A-k>", ":m .-2<cr>==", opt)
-- key("v", "p", '"_dP', opt)

-- Move text in visual block mode
key("x", "J", ":move '>+1<cr>gv-gv", opt)
key("x", "K", ":move '<-2<cr>gv-gv", opt)
key("x", "<A-j>", ":move '>+1<cr>gv-gv", opt)
key("x", "<A-k>", ":move '<-2<cr>gv-gv", opt)

-- Telescope
key("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opt)

