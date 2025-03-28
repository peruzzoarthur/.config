return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        -- theme = 'tokyonight'
        theme = "catppuccin"
      }
    })
  end
}
