local map = vim.keymap.set

map("n", "<leader>pv", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>ps", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Saves File" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
