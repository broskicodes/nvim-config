require("toggleterm").setup {
	-- size = 20 | function(term)
	--     if term.direction == "horizontal" then
	--         return 20
	--     elseif term.direction == "vertical" then
	--         return vim.o.columns * 0.4
	--     end
	-- end
}

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set('t', '<Esc><Esc>', function()
	-- exit terminal insert mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)

	-- find a non-terminal window
	for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(w)
		if vim.api.nvim_buf_get_option(buf, 'buftype') ~= 'terminal' then
			vim.api.nvim_set_current_win(w)
			return
		end
	end
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, '<Esc>', function()
	if vim.bo.buftype == 'terminal' then
		for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			local buf = vim.api.nvim_win_get_buf(w)
			if vim.api.nvim_buf_get_option(buf, 'buftype') ~= 'terminal' then
				vim.api.nvim_set_current_win(w)
				return
			end
		end
	end
end, { noremap = true })

vim.keymap.set({ "n", "v" }, '<leader>ts', function()
	vim.cmd('TermSelect')
	-- figure out how to programatically select term # and enter insert mode
end, { desc = 'Select terminal' })
vim.keymap.set({ "n", "v" }, '<leader>tt', '<cmd>ToggleTerm size=20 dir=. direction=horizontal<CR>',
	{ desc = 'Toggle terminal' })
vim.keymap.set({ "n", "v" }, '<leader>tn',
	function()
		local c = vim.fn.getcharstr()
		vim.cmd(c .. 'ToggleTerm size=20 dir=. name=term' .. c .. ' direction=horizontal')
	end,
	{ desc = 'Toggle terminal with prefix' }
)
