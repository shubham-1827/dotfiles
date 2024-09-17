return {

  -- lsp, dap, cmp
  require("lsp_dap.lsp-config"),
  require("lsp_dap.null-ls"),
  require("lsp_dap.cmp"),
  require("lsp_dap.treesitter"),
  require("lsp_dap.nvim-dap"),

  -- productivity
  require("plugins.productivity.coderunner"),
  require("plugins.productivity.comment"),
  require("plugins.productivity.lazydev"),
  require("plugins.productivity.toggleterm"),
  require("plugins.productivity.trouble"),
  require("plugins.productivity.vim-tmux"),

  -- motions
  require("plugins.motions.flash"),
  require("plugins.motions.hardtime"),
  require("plugins.motions.auto-pairs"),
  require("plugins.motions.which-key"),

  -- themes
  require("plugins.themes.gruvbox"),
  require("plugins.themes.catppuccin"),

  -- cp
  require("plugins.cp.leetcode"),

  -- git
require("git.git_signs"),
require("git.lazygit"),

  -- ai
  require("plugins.ai.codeium"),

  -- file-navigation
  require("plugins.file_navigation.neo-tree"),
  require("plugins.file_navigation.oil"),
  require("plugins.file_navigation.telescope"),

  -- looks
  require("plugins.looks.barbar"),
  require("plugins.looks.dashboard"),
  require("plugins.looks.lualine"),
  require("plugins.looks.colorizer"),
  require("plugins.looks.dressing"),
  require("plugins.looks.indent_blankline"),
  require("plugins.looks.noice"),
  require("plugins.looks.barbeque"),
  require("plugins.looks.scrollbar"),

  -- fun
require("fun.cellular"),
require("fun.vim-be-good"),
}
