return {
  "catppuccin/nvim", name = "catppuccin",
  priority = 1000, -- to load this plugin at the very start

  config = function ()
    require("catppuccin").setup ({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      -- transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "underline" },
        loops = {},
        functions = {"underline"},
        keywords = {"bold"},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {"italic"},
        properties = {},
        types = {"bold"},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
       telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic", "bold" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          -- underlines = {
          --   errors = { "underline" },
          --   hints = { "underline" },
          --   warnings = { "underline" },
          --   information = { "underline" },
          --   ok = { "underline" },
          -- },
          inlay_hints = {
            background = true,
          },
        },
        barbar = true,
        lsp_trouble = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        which_key = true,
        neotree = true,
      },
    })
  end

}
