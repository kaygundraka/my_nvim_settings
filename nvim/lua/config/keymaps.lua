local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<cr>")

-- pane naviagtion
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- clear search hl
mapKey("<leader>h", ":nohlsearch<CR>")

-- Back To Previous File (Toggle)
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Toggle to last file" })
