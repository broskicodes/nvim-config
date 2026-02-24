-- git signs for uncommitted changes
require('gitsigns').setup {
	current_line_blame = true,
}

-- better diff view for commits
vim.keymap.set({ "n", "v" }, '<leader>do', '<cmd>DiffviewOpen<CR>', { desc = 'Open diff view' })
vim.keymap.set({ "n", "v" }, '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = 'Close diff view' })

vim.keymap.set({ "n", "v" }, '<leader>dl', '<cmd>diffget LOCAL<CR>', { desc = 'Take local changes' })
vim.keymap.set({ "n", "v" }, '<leader>dr', '<cmd>diffget REMOTE<CR>', { desc = 'Take remote changes' })

vim.keymap.set({ "n", "v" }, '<leader>db', '<cmd>DiffviewFileHistory<CR>',
	{ desc = 'View diff for changes on current brach' })
vim.keymap.set({ "n", "v" }, '<leader>df', '<cmd>DiffviewFileHistory %<CR>',
	{ desc = 'View diff for changes in current file' })
