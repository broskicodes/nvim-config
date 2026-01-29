vim.opt.number = true
vim.opt.relativenumber = true

-- Global clipboard
vim.opt.clipboard = "unnamedplus"

-- Auto-reload files changed outside of Neovim
vim.o.autoread = true

-- Trigger autoread when focus is gained or buffer is entered
vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold" },
	{
		pattern = "*",
		command = "checktime"
	}
)
