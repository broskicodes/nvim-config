local harpoon = require("harpoon")

harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

vim.keymap.set({ "n", "v" }, "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to harpoon list" })
vim.keymap.set({ "n", "v" }, "<leader>ht", function() toggle_telescope(harpoon:list()) end,
	{ desc = "Open harpoon window" })

-- vim.keymap.set({ "n", "v" }, "<leader>h1", function() harpoon:list():select(1) end)
-- vim.keymap.set({ "n", "v" }, "<leader>h2", function() harpoon:list():select(2) end)
-- vim.keymap.set({ "n", "v" }, "<leader>h3", function() harpoon:list():select(3) end)
-- vim.keymap.set({ "n", "v" }, "<leader>h4", function() harpoon:list():select(4) end)
vim.keymap.set('n', '<leader>hs',
	function()
		local c = tonumber(vim.fn.getcharstr())
		if c then
			harpoon:list():select(c)
		end
	end,
	{ desc = 'Jump to file in harpoon list' }
)

vim.keymap.set({ "n", "v" }, "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set({ "n", "v" }, "<leader>hn", function() harpoon:list():next() end)

