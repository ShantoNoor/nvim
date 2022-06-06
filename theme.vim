"colorscheme gruvbox
"colorscheme twilight256
"colorscheme gotham256 
" colorscheme purify
"colorscheme afterglow 
" colorscheme orbital
"colorscheme jellybeans
"colorscheme spacecamp 
"colorscheme molokai 
colorscheme nord

if g:os == 'Darwin' && exists("&termguicolors") && exists("&winblend")
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
	colorscheme NeoSolarized
endif

