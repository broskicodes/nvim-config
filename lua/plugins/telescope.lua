require('telescope').setup {
	defaults = {},
	pickers = {},
	extensions = {}
}

local builtin = require('telescope.builtin')
vim.keymap.set({ "n", "v" }, '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set({ "n", "v" }, '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set({ "n", "v" }, '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set({ "n", "v" }, '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set({ "n", "v" }, '<leader>fc', "<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ desc = 'Telescope file scope grep' })
