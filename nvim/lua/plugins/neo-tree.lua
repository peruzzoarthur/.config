return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- Track if Neo-tree is open or not
		vim.g.neo_tree_opened = false

		-- Bind <C-e> to open Neo-tree unconditionally
		vim.keymap.set("n", "<C-e>", function()
			vim.cmd("Neotree filesystem reveal right")
			vim.g.neo_tree_opened = true
		end, { noremap = true, silent = true })

		-- Bind <C-A-e> to close Neo-tree
		vim.keymap.set("n", "<C-A-e>", function()
			if vim.g.neo_tree_opened then
				vim.cmd("Neotree close")
				vim.g.neo_tree_opened = false
			end
		end, { noremap = true, silent = true })

		-- Auto-update the variable when Neo-tree is closed with other commands
		vim.api.nvim_create_autocmd("BufWinLeave", {
			pattern = "*NeoTree*",
			callback = function()
				vim.g.neo_tree_opened = false
			end,
		})

		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
			},
		})
	end,
}
