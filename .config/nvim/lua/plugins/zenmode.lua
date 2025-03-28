-- return {
--   "folke/zen-mode.nvim",
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--     window = {
--       backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
--       -- height and width can be:
--       -- * an absolute number of cells when > 1
--       -- * a percentage of the width / height of the editor when <= 1
--       -- * a function that returns the width or the height
--       width = 120, -- width of the Zen window
--       height = 1, -- height of the Zen window
--       -- by default, no options are changed for the Zen window
--       -- uncomment any of the options below, or add other vim.wo options you want to apply
--     },
--
--   },
-- }
return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
      },
    })

    vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
  end,
}
