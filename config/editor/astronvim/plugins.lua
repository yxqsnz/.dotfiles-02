return {
  ["wakatime/vim-wakatime"] = {
    event = "BufRead",
  },

  ["nullchilly/fsread.nvim"] = {
    cmd = "FSToggle",
    module = "fsread",
  },

  ["phaazon/hop.nvim"] = {
    cmd = { "HopWord" },
    config = function()
      require("hop").setup({})
    end,
  },

  ["andweeb/presence.nvim"] = {
    event = "BufRead",
    config = function()
      require("presence"):setup()
    end,
  },

  ["pwntester/octo.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },

  ["nvim-neorg/neorg"] = {
    requires = "nvim-lua/plenary.nvim",
    event = { "BufRead", "BufNewFile" },
    ft = "norg",
    cmd = "Neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.export"] = { config = {} },
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.norg.concealer"] = {},
          ["core.keybinds"] = {},
          ["core.export.markdown"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                math = "~/Documents/Math",
              },
            },
          },
        },
      })
    end,
  },

  ["mrshmllow/document-color.nvim"] = {
    event = { "BufReadPre" },
    config = function()
      require("document-color").setup({
        mode = "foreground",
      })
    end,
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            auto = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
            right_align = true,
          },
        },
        server = astronvim.lsp.server_settings("rust_analyzer"), -- get the server settings and built in capabilities/on_attach
      })
    end,
  },

  ["RRethy/nvim-treesitter-endwise"] = {},
  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        handler_opts = {
          border = "single",
        },
      })
    end,
  },
}
