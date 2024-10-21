-- Define a local map function for convenience
local map = function(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- save sessions with persistance
map("n", "<leader>ss", function()
	require("persistence").load()
end, { desc = "load the session for the current directory" })
map("n", "<leader>sS", function()
	require("persistence").select()
end, { desc = "Select the session to load" })
map("n", "<leader>sl", function()
	require("persistence").load({ last = true })
end, { desc = "Load the last working session" })
map("n", "<leader>sd", function()
	require("persistence").stop()
end, { desc = "stop saving sessions" })

-- Buffer Navigation
map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Move to the next buffer" })
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Move to the previous buffer" })

-- Re-order Buffers
map("n", "<leader>i", "<Cmd>BufferMovePrevious<CR>", { desc = "Move the current buffer to the previous position" })
map("n", "<leader>o", "<Cmd>BufferMoveNext<CR>", { desc = "Move the current buffer to the next position" })

-- Goto Buffer
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", { desc = "Go to buffer 5" })
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", { desc = "Go to buffer 6" })
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", { desc = "Go to buffer 7" })
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", { desc = "Go to buffer 8" })
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", { desc = "Go to buffer 9" })
map("n", "<leader>0", "<Cmd>BufferLast<CR>", { desc = "Go to the last buffer" })

-- Pin/Unpin Buffer
map("n", "<leader>p", "<Cmd>BufferPin<CR>", { desc = "Pin or unpin the current buffer" })

-- Close Buffer
map("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close the current buffer" })

-- Buffer Picking Mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", { desc = "Enter buffer-picking mode" })

-- Sort Buffers
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "Sort buffers by buffer number" })
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", { desc = "Sort buffers by name" })
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", { desc = "Sort buffers by directory" })
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { desc = "Sort buffers by language" })
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { desc = "Sort buffers by window number" })

-- Clear search highlights
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the top window" })

-- Neotree Toggle
map("n", "<C-n>", ":Neotree filesystem toggle left<CR>", { desc = "Open Neotree" })

-- LSP Key Mappings
-- Basic LSP
map("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "<leader>gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find references" })
map("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
map("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
map("n", "<leader>fi", "<Cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format document" })
map("n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostic" })
map("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
map("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
-- map("n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover documentation" })

-- Additional LSP
map("n", "<leader>sh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })
map("n", "<leader>di", "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", { desc = "Show incoming calls" })
map("n", "<leader>do", "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>", { desc = "Show outgoing calls" })

-- Workspace Management
map("n", "<leader>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { desc = "Add workspace folder" })
map("n", "<leader>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { desc = "Remove workspace folder" })
map(
	"n",
	"<leader>wl",
	"<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
	{ desc = "List workspace folders" }
)

-- code runner keymaps
map("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code" })
map("n", "<leader>rf", ":RunFile<CR>", { desc = "Run the entire file" })
map("n", "<leader>rft", ":RunFile tab<CR>", { desc = "Run File in new tab" })
map("n", "<leader>rp", ":RunProject<CR>", { desc = "Run Project" })
map("n", "<leader>rc", ":RunClose<CR>", { desc = "Close code runner" })
map("n", "<leader>crf", ":CRFiletype<CR>", { desc = "check file type" })
map("n", "<leader>crp", ":CRProjects<CR>", { desc = "List Projects" })

-- Telescope Key Mappings
local builtin = require("telescope.builtin")

-- File operations
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fa", function()
	builtin.find_files({ hidden = true, follow = true })
end, { desc = "Find all files (including hidden and ignored)" })
map("n", "<leader>fA", function()
	builtin.find_files({ no_ignore = true, hidden = true })
end, { desc = "Find files including ignored" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "List recent files" })

-- Live grep and search
map("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fW", function()
	builtin.grep_string({ search = vim.fn.input("Grep for > ") })
end, { desc = "Grep for specific string" })
map("n", "<leader>fR", builtin.resume, { desc = "Resume last Telescope search" })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in the current buffer" })

-- Buffer management
map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
map("n", "<leader>bd", function()
	builtin.buffers({ sort_mru = true })
end, { desc = "List buffers sorted by most recently used" })
map("n", "<leader>fc", builtin.commands, { desc = "List commands" })

-- Git related
map("n", "<leader>gc", builtin.git_commits, { desc = "Show Git commits" })
map("n", "<leader>gs", builtin.git_status, { desc = "Show Git status" })
map("n", "<leader>gC", builtin.git_bcommits, { desc = "Show Git commits for the current buffer" })

-- Help and documentation
map("n", "<leader>fh", builtin.help_tags, { desc = "Show help tags" })
map("n", "<leader>fm", builtin.man_pages, { desc = "Show man pages" })
-- map('n', '<leader>fr', builtin.repl, { desc = 'Show REPL documentation' })

-- Other
map("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Show LSP document symbols" })
map("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Show LSP workspace symbols" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Show key mappings" })
map("n", "<leader>fm", builtin.marks, { desc = "Show marks" })

-- Oil realted mappings
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory" })

-- git signs related mappings

-- Navigation
map(
	"n",
	"]c",
	"&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
	{ expr = true, desc = "Jump to the next git hunk. If in diff mode, the default behavior of ']c' is used." }
)
map(
	"n",
	"[c",
	"&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
	{ expr = true, desc = "Jump to the previous git hunk. If in diff mode, the default behavior of '[c' is used." }
)

-- Actions
map(
	"n",
	"<leader>hs",
	":Gitsigns stage_hunk<CR>",
	{ desc = "Stage the current hunk. Can be used in normal and visual mode." }
)
map(
	"v",
	"<leader>hs",
	":Gitsigns stage_hunk<CR>",
	{ desc = "Stage the current hunk. Can be used in normal and visual mode." }
)
map(
	"n",
	"<leader>hr",
	":Gitsigns reset_hunk<CR>",
	{ desc = "Reset the current hunk. Can be used in normal and visual mode." }
)
map(
	"v",
	"<leader>hr",
	":Gitsigns reset_hunk<CR>",
	{ desc = "Reset the current hunk. Can be used in normal and visual mode." }
)
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage the entire buffer." })
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo the staging of the current hunk." })
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset the entire buffer." })
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview the current hunk." })
map(
	"n",
	"<leader>hb",
	'<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
	{ desc = "Blame the current line, showing the full blame information." }
)
map(
	"n",
	"<leader>tb",
	"<cmd>Gitsigns toggle_current_line_blame<CR>",
	{ desc = "Toggle the display of the blame information for the current line." }
)
map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Show the diff of the current file." })
map(
	"n",
	"<leader>hD",
	'<cmd>lua require"gitsigns".diffthis("~")<CR>',
	{ desc = "Show the diff between the current file and the last commit." }
)
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle the display of deleted lines." })

-- Text object
map(
	"o",
	"ih",
	":<C-U>Gitsigns select_hunk<CR>",
	{ desc = "Select the text object of the current hunk. Works in operator-pending and visual modes." }
)
map(
	"x",
	"ih",
	":<C-U>Gitsigns select_hunk<CR>",
	{ desc = "Select the text object of the current hunk. Works in operator-pending and visual modes." }
)

-- quickfix list and location list with git signs and trouble
map("n", "<leader>hq", "<cmd>Gitsigns setqflist all<CR>", { desc = "Open git changes quickfix list" })
map("n", "<leader>hl", "<cmd>Gitsigns setloclist<CR>", { desc = "Open git changes location list" })

-- Custom Commands
map("n", "<C-c>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center the cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center the cursor" })
map("i", "jk", "<ESC>", { desc = "Better than pressing ESC i guess" })
map("n", "n", "nzzzv", { desc = "center when searching with n" })
map("n", "N", "Nzzzv", { desc = "center when searching with N" })
map("n", "<leader>o", "o<ESC>", { desc = "add new line below cursor" })
map("n", "<leader>O", "O<ESC>", { desc = "add new line above cursor" })
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wqall", "wqall", {})

-- Remap Ctrl-h, Ctrl-j, Ctrl-k, Ctrl-l for navigation in insert mode with descriptions
map("i", "<C-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<C-l>", "<Right>", { desc = "Move right in insert mode" })

-- vs code like alt + j, k to move line up and down
map("n", "<leader>j", ":m .+1<CR>==", { desc = "Move text down" })
map("n", "<leader>k", ":m .-2<CR>==", { desc = "Move text up" })
