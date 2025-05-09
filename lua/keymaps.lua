local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- map Ctrl-c to Escape
keymap.set("i", "<C-c>", "<Esc>")

-- telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")

-- neotree
keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})

-- commentry
keymap.set({"n", "v"}, "<C-/>", ":CommentToggle<cr>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")

-- Delete
keymap.set("n", "x", '"_x')
keymap.set("n", "D", '"_D')
keymap.set({"n", "v"}, "d", '"_d')
-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>l", "<C-w>l")

keymap.set("n", "<C-s>", ":wa!<Return>")
keymap.set("n", "<leader>qa", ":qa!<Return>")
keymap.set("n", "<C-q>", ":wa<Return>:qa<Return>")

-- clipboard
vim.keymap.set({"n", "v"}, "p", [["+p]])
vim.keymap.set({"n", "v"}, "y", [["+y]])


function ResizeSV(width)
  local total_width = vim.o.columns
  local left_width = math.floor(total_width * width)
  vim.cmd.wincmd('h')
  vim.api.nvim_win_set_width(0, left_width)
end

local function Layout0() 
  vim.cmd('cd ~/cp-root/')
  vim.cmd('only')
  vim.cmd('edit a.cpp')
  vim.opt.laststatus = 3
end

local function Layout1() 
  vim.cmd('cd ~/cp-root/')
  vim.cmd('only')
  vim.cmd('edit a.cpp')
  vim.cmd('vertical split input.txt')
  ResizeSV(0.75)
  vim.cmd('wincmd l')
  vim.cmd('split output.txt')
  vim.cmd('wincmd h')
  vim.opt.laststatus = 3
end

local function Layout2() 
  vim.cmd('cd ~/cp-root/')
  vim.cmd('only')
  vim.cmd('edit a.cpp')
  vim.cmd('vertical split input.txt')
  ResizeSV(0.7)
  vim.cmd('wincmd l')
  vim.cmd('split debug.txt')
  vim.cmd('split output.txt')
  vim.cmd('wincmd h')
  vim.opt.laststatus = 3
end

keymap.set('n', '<leader>/', Layout0)
keymap.set('n', '<leader>.', Layout2)
keymap.set('n', '<leader>,', Layout1)

local function ReloadOutputFile()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match("output.txt$") then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("checktime")
      end)
    end
  end
end

local Terminal  = require('toggleterm.terminal').Terminal

local cpp_build_and_run = Terminal:new({
  cmd = 'g++ -std=c++20 -O3 -I"./" -DDEBUG "a.cpp" && ./"a.out" && rm "a.out"',
  on_open = function(term)
    vim.cmd("wa")
  end,
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  on_exit = function(term)
    ReloadOutputFile()
  end,
})
function _cpp_build_and_run_toggle()
  cpp_build_and_run:toggle()
end
keymap.set("n", "<leader>b", _cpp_build_and_run_toggle, opts)

local cpp_build_and_run_io = Terminal:new({
  cmd = 'g++ -std=c++20 -O3 -I"./" -DDEBUG "a.cpp" && ./"a.out" <input.txt >output.txt && rm "a.out"',
  on_open = function(term)
    vim.cmd("wa")
  end,
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
  on_exit = function(term)
    ReloadOutputFile()
  end,
  on_stdout = function(term, data, name)
    vim.api.nvim_echo({{"[Compiled and executed successfully]", "Question"}}, false, {})
  end,
})
function _cpp_build_and_run_io_toggle()
  cpp_build_and_run_io:toggle()
end
keymap.set({"n", "i"}, "<C-b>", _cpp_build_and_run_io_toggle, opts)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "<leader>cpp", [[:r template.cpp<CR>kdd]], { buffer = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "<leader>pp", [[:r base.cpp<CR>kdd]], { buffer = true, silent = true })
  end,
})

