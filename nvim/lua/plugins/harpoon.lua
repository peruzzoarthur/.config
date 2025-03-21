return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },

		-- Navigation bindings for Harpoon
		{ "<M-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Navigate to Harpoon file 1" },
		{ "<M-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Navigate to Harpoon file 2" },
		{ "<M-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Navigate to Harpoon file 3" },
		{ "<M-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Navigate to Harpoon file 4" },
	},
}
