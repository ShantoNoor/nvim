return {
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin"
  --   end
  -- },
  -- {
  --   "gmr458/vscode_modern_theme.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       require("vscode_modern").setup({
  --           cursorline = true,
  --           transparent_background = false,
  --           nvim_tree_darker = true,
  --       })
  --       -- vim.cmd.colorscheme("vscode_modern")
  --   end,
  -- },
  -- {
  --   'jaredgorski/spacecamp',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       vim.cmd.colorscheme("spacecamp")
  --   end,
  -- },
  -- {
  --   'martinsione/darkplus.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       vim.cmd.colorscheme("darkplus")
  --   end,
  -- },
  -- {
  --   "ofirgall/ofirkai.nvim",
  --   config = function()
  --     require('ofirkai').setup({
  --       theme = 'dark_blue', -- Choose theme to use, available themes: 'dark_blue'
  --       scheme = require('ofirkai').scheme, -- Option to override scheme
  --       custom_hlgroups = {},              -- Option to add/override highlight groups
  --       remove_italics = false,            -- Option to change all the italics style to none
  --     })
  --     vim.cmd.colorscheme("ofirkai")
  --   end
  -- },
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   config = function()
  --     require("monokai-pro").setup({
  --       filter = "spectrum",
  --       transparent_background = false,
  --       terminal_colors = true,
  --       devicons = true,
  --       background_clear = {
  --         -- "float_win",
  --         "toggleterm",
  --         "telescope",
  --         -- "which-key",
  --         -- "renamer",
  --         -- "notify",
  --         -- "nvim-tree",
  --         "neo-tree",
  --         -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  --       },
  --     })
  --     vim.cmd.colorscheme("monokai-pro-spectrum")
  --   end
  -- },
  -- {
  --   "sainnhe/sonokai",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("sonokai")
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --   },
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight-night")
  --   end,
  -- },
  { 
    "EdenEast/nightfox.nvim", 
    config = function()
      vim.cmd("colorscheme carbonfox")
    end
  }
}
