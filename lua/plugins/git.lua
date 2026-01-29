-- git signs for uncommitted changes
require('gitsigns').setup {
	current_line_blame = true,
}

-- better diff view for commits
vim.keymap.set('n', '<leader>db', '<cmd>DiffviewFileHistory<CR>', { desc = 'View diff for changes on current brach' })
vim.keymap.set('n', '<leader>df', '<cmd>DiffviewFileHistory %<CR>', { desc = 'View diff for changes in current file' })
