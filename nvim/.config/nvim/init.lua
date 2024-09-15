require("options")
require("config.lazy")
require("config.lsp-config")
require("mappings")

vim.cmd.colorscheme("gruvbox")
-- cursor color is set in windows terminal settings
vim.cmd("highlight CursorLine guibg=#504945")
vim.cmd("highlight CursorColumn guibg=#504945")
