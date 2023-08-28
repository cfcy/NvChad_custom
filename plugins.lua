local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    'nvim-pack/nvim-spectre',
    init = function()
      require("core.utils").load_mappings "spectre"
    end,
  },

  {
    'sharkdp/fd',
  },

  {
    'stevearc/aerial.nvim',
    enabled = false,
    init = function()
      require("core.utils").load_mappings "aerial"
    end,
    opts = {
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end,

      filter_kind = false,
    },
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
  },

  {
    'simrat39/symbols-outline.nvim',
    lazy = false,
    init = function()
      require("core.utils").load_mappings "symbols_outline"
    end,
    opts = {
      -- to customize the icons, visit https://www.nerdfonts.com/cheat-sheet
      -- and search a icon, then hover -> COPY -> Icon.
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "󰕳", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "", hl = "@type" },
        Method = { icon = "", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "", hl = "@type" },
        Interface = { icon = "", hl = "@type" },
        Function = { icon = "󰊕", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "󰅳", hl = "@string" },
        Number = { icon = "", hl = "@number" },
        Boolean = { icon = "", hl = "@boolean" },
        Array = { icon = "󰅨", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "󰌆", hl = "@type" },
        Null = { icon = "󰟢", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "", hl = "@type" },
        Event = { icon = "", hl = "@type" },
        Operator = { icon = "", hl = "@operator" },
        TypeParameter = { icon = "", hl = "@parameter" },
        Component = { icon = "󰡀", hl = "@function" },
        Fragment = { icon = "󰞤", hl = "@constant" },
      },
    },
    config = function(_, opts)
      require("symbols-outline").setup(opts)
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
