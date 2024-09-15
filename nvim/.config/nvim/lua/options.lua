vim.opt.termguicolors = true
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set wrap")
vim.cmd("set linebreak")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
-- vim.cmd("syntax on") -- dont turn this on lsp will not attach if options are loaded before lspconfig
vim.cmd("set hlsearch")
vim.cmd("set matchpairs+=<:>")
vim.cmd("set incsearch")
vim.cmd("set undofile")
vim.cmd("set undolevels=1000")
vim.cmd("set background=dark")
vim.cmd("set mouse=a")
vim.cmd("set history=1000")
vim.o.completeopt = "noinsert,noselect"

-- Disable automatic comments when entering new lines
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=cro
]])

vim.cmd([[
  " Automatically remove trailing whitespace on save
  augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END

  " Highlight yanked text
  augroup yank_highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 200 })
  augroup END

]])

-- to remove cursorcoloum and cursorline from inactive window
vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    command = "setlocal cursorline cursorcolumn",
})
vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    command = "setlocal nocursorline nocursorcolumn",
})
