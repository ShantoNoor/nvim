if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system('uname -s'), '\n', '', '')
	endif
endif

if g:os == "Darwin"
  set clipboard+=unnamedplus
elseif g:os == "Linux"
  set clipboard=unnamedplus,unnamed
elseif g:os == "Windows"
  set clipboard^=unnamed,unnamedplus
endif
