vim.g.mapleader = " "

-- map arrows to nav multiple lines

vim.keymap.set({ "n", "v" }, "<C-k>", "15gk", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-j>", "15gj", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<left>", "20gh", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<right>", "20gl", { noremap = true, silent = true })

-- other
vim.keymap.set("n", "<leader>gd", function()
    vim.cmd("tab split")
    vim.lsp.buf.definition()
end, { desc = "Go to definition in new tab" })

-- unmap so we don't break my commenter cmds
vim.keymap.set("v", "c", "<Nop>", { desc = "Unmap c in vis mode" })
