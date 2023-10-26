
local plugins = {

  { "elkowar/yuck.vim" , lazy = false },  -- load a plugin at startup

  -- You can use any plugin specification from lazy.nvim
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require "custom.configs.truezen" -- just an example path
    end,
  },

  -- this opts will extend the default opts 
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- low level
        "c",
        "zig",
        "bash"},
    },
  },
  
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  -- If your opts uses a function call, then make opts spec a function*
  -- should return the modified default config as well
  -- here we just call the default telescope config 
  -- and then assign a function to some of its options
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "plugins.configs.telescope"
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }

      return conf
    end,
  },
  
  {
  "neovim/nvim-lspconfig",
    dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },

   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },

  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua"
      },
    },
  },
  {
    "andweeb/presence.nvim",
    lazy = false
  }
}

return plugins

