"------------------------------
" Build
" inorder to work properly clipboard.vim must
" needs to be sourced first

function! Build(file_base_name, file_type, input_output = " ") abort
  let fb = expand(a:file_base_name)
  let ft = expand(a:file_type)
  let io = expand(a:input_output)

  let fn = '"' . fb . '.' . ft . '"'
  let fb = '"' . fb . '"'

  if g:os == 'Windows'
    let cmd = 'echo [ ' . fn . ' ] && echo.'
  else
    let cmd = 'echo \>\> ' . fn . ' && echo'
  endif

  if ft == 'py'
    if g:os == 'Windows'
      let cmd .= ' && python ' . fn
  	else
      let cmd .= ' && python3 ' . fn
  	endif


  elseif ft == 'cpp'
    let cmd .= ' && g++ -std=c++17 -DDEBUG ' . fn

    if g:os == 'Windows'
      let cmd .= ' && a.exe'
  	else
      let cmd .= ' && ./a.out'
  	endif

  elseif ft == 'c'
    let cmd .= ' && gcc ' . fn

    if g:os == 'Windows'
      let cmd .= ' && a.exe'
  	else
      let cmd .= ' && ./a.out'
  	endif

  elseif ft == 'js'
    let cmd .= ' && node ' . fn

  endif

  if io != " "
    let io = ' "' . io . '"'
    let cmd .= io
  endif

  if g:os == 'Windows'
    let cmd .= ' && echo. && echo [ Finished ]'
  endif

  exec 'split'
  exec 'term ' . cmd 
  exec 'setlocal nornu nonu'
  exec 'startinsert'
  autocmd BufEnter <buffer> startinsert
endfunction

command! -nargs=0 Exe call Build('%:t:r', '%:e')
command! -nargs=0 Exei call Build('%:t:r', '%:e', '"<input.txt"')
command! -nargs=0 Exeo call Build('%:t:r', '%:e', '">output.txt"')
command! -nargs=0 Exeio call Build('%:t:r', '%:e', '"<input.txt >output.txt"')
command! -nargs=1 -complete=file Exea call Build('%:t:r', '%:e', <q-args>)
  
noremap <C-b> :wa<CR>:Exe<CR> 
noremap <Space>v :wa<CR>:Exe<CR> 
noremap <Space>b :wa<CR>:Exei<CR> 
noremap <Space>n :wa<CR>:Exeo<CR> 
noremap <Space>m :wa<CR>:Exeio<CR> 
 
