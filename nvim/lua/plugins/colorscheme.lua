return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Change this to your preferred flavour (latte, frappe, macchiato, mocha)
			transparent_background = true, -- Enable transparent background
			integrations = {
				-- Add integrations here if needed, for example:
				treesitter = true,
				nvimtree = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#A6E3A1", bg = "NONE" }) -- Line numbers
	end,
}
