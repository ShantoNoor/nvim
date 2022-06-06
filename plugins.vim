if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

if has("nvim")
	Plug 'overcache/NeoSolarized'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'windwp/nvim-autopairs'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'djoshea/vim-autoread'

  "cmp plugins
  Plug 'hrsh7th/nvim-cmp' "The completion plugin
  Plug 'hrsh7th/cmp-buffer' "buffer completions
  Plug 'hrsh7th/cmp-path' "path completions
  Plug 'hrsh7th/cmp-cmdline' "cmdline completions
  Plug 'saadparwaiz1/cmp_luasnip' "snippet completions
  Plug 'tpope/vim-commentary'
  Plug 'mg979/vim-visual-multi'

  "snippets
  Plug 'L3MON4D3/LuaSnip' "snippet engine
  Plug 'rafamadriz/friendly-snippets'
endif

call plug#end()
