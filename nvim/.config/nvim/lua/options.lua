vim.opt.termguicolors = true
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
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
vim.wo.fillchars = "eob: " -- to remove the tilde (~) at the end of the buffer
vim.o.completeopt = "noinsert,noselect" -- to disable the default auto complete of nvim, if you are using cmp

-- Disable automatic comments when entering new lines
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=cro
]])

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- autocommand to remove the whitespaces in the whole document
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "markdown" then
			local save_cursor = vim.fn.getpos(".") -- Save cursor position
			vim.cmd([[%s/\s\+$//e]]) -- Remove trailing whitespace
			vim.fn.setpos(".", save_cursor) -- Restore cursor position
		end
	end,
})

-- to remove cursorcoloum and cursorline from inactive window
vim.api.nvim_create_autocmd("WinEnter", {
	pattern = "*",
	command = "setlocal cursorline cursorcolumn",
})
vim.api.nvim_create_autocmd("WinLeave", {
	pattern = "*",
	command = "setlocal nocursorline nocursorcolumn",
})

-- to use the "+y to copy the contents to the system clipboard in windows from wsl
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'wsl.exe clip.exe',
        ['*'] = 'wsl.exe clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe Get-Clipboard',
        ['*'] = 'powershell.exe Get-Clipboard',
    },
}

