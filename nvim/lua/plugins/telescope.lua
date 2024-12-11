return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'jonarrien/telescope-cmdline.nvim', },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>Fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>Fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>Fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {desc = 'Telescope oldfiles'})
      vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope cmdline<cr>', {desc = 'Telescope Cmdline'})
      vim.keymap.set('n', 'Q', '<cmd>Telescope cmdline<cr>', {desc = 'Telescope Cmdline'})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
          require("telescope").load_extension('cmdline')
    end
  }}
