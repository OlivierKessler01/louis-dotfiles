local o = vim.o
local cmd = vim.cmd

-- tab and space
o.tabstop = 2
o.shiftwidth = o.tabstop
o.expandtab = true -- use the appropriate number of spaces to insert a <Tab> in insert mode
o.list = true -- display tab
o.nojoinspaces = true -- use one space, not two, after punctuation
o.smartindent = true -- do smart autoindenting when starting a new line

-- copy yank
o.autoindent = true -- copy indent from current line when starting a new line
cmd [[ set clipboard=unnamedplus ]] -- yank in clipboard
cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300} ]] -- highlight yank

-- search
o.hlsearch = true -- highlight searched-for phrases
o.incsearch = true -- but do highlight-as-I-type the search string
o.ignorecase = true -- makes pattern matching case-insensitive
o.smartcase = true -- overrides ignorecase if your pattern contains mixed case
o.gdefault = true -- this makes search/replace global by default"

-- encoding
o.encoding = "utf-8" -- change how nvim represents characters on the screen
o.fileencoding = "utf-8" -- set the encoding of files written

-- backup
o.nobackup = true -- turn backup off, since most stuff is versioned anyway
o.nowb = true
o.noswapfile = true
o.nowritebackup = true -- some servers have issues with backup files, see #649
o.undofile = true -- enable persistent undo
cmd [[ set undodir=~/.undodir ]] -- where to save undo histories

-- spell checking
o.spelllang = "en"
o.spell = false -- by default, do not spell check

-- responsiveness
o.updatetime = 300 -- shorter updatetime for better user exp (default: 4000ms)
o.timeout = true
o.timeoutlen = 100 -- default 1000ms

-- panes
o.splitbelow = true --default split below
o.splitright = true --default split right

-- bottom status line
o.laststatus = 3 -- always show statusline in single statusline mode

-- editor
o.scrolloff = 7 -- set 7 lines to the cursor when moving vertically
o.cursorline = true -- highlight line
o.breakindent = true -- maintain  indentation when breaking long lines

-- file
o.hidden = true -- TextEdit might fail if hidden is not set
o.autoread = true -- refresh file if it changes on disc
o.confirm = true -- ask me if I try to leave the editor with an unsaved modified file in a buffer
o.number = true -- show current line number
o.relativenumber = true -- show relative line numbers

-- misc
o.showcmd = true -- display incomplete commands
o.showmode = true -- show insert mode in command line
cmd [[ set shortmess+=c ]] -- don't pass messages to |ins-completion-menu|
o.backspace = "indent,eol,start" --sane backspace behaviour
o.history = 1000 -- A history of ":" commands, and a history of previous search patterns is remembered

-- disable default plugins
vim.g.loaded_2html_plugin = 1
-- do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_sql_completion = 1 -- disable sql omni completion, it is broken.

vim.g.auto_save = 1 -- enable AutoSave

