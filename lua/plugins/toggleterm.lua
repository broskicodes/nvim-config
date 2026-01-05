require("toggleterm").setup{
    -- size = 20 | function(term)
    --     if term.direction == "horizontal" then
    --         return 20
    --     elseif term.direction == "vertical" then
    --         return vim.o.columns * 0.4
    --     end
    -- end
}

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n><C-w>p]])
vim.keymap.set('n', '<Esc>', 
    function()
        if vim.bo.buftype == 'terminal' then
            vim.cmd('wincmd p')
        end
    end
)

vim.keymap.set('n', '<leader>st', '<cmd>TermSelect<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm size=20 dir=. direction=horizontal<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('n', '<leader>xt', 
    function()
        local c = vim.fn.getcharstr()
        vim.cmd(c .. 'ToggleTerm size=20 dir=. name=term' .. c .. ' direction=horizontal')
    end, 
    { desc = 'Toggle terminal with prefix' }
)
