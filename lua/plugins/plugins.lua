return {
  { "olimorris/onedarkpro.nvim", lazy = false },
  { "ellisonleao/gruvbox.nvim" },
  { "projekt0n/github-nvim-theme" },
  ---[[
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }, --]]
  {
    "cordx56/rustowl",
    version = "*", -- Latest stable version
    build = "cargo binstall rustowl",
    lazy = false, -- This plugin is already lazy
    opts = {
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set("n", "<leader>o", function()
            require("rustowl").toggle(buffer)
          end, { buffer = buffer, desc = "Toggle RustOwl" })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local clangd
      --local esp_idf_path = os.getenv("IDF_PATH")
      --[[if esp_idf_path then
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=/home/tommaso/.espressif/tools/riscv32-esp-elf/esp-13.2.0_20240530/riscv32-esp-elf/bin/*,"
              .. "/home/tommaso/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/bin/*",
          },
        }
      else]]
      clangd = {
        cmd = {
          "clangd-19",
          "--query-driver=/usr/bin/arm-none-eabi-*,/usr/bin/gcc-*",
        },
      }
      --end
      opts.servers = vim.tbl_extend("force", opts.servers or {}, {
        clangd = clangd,
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      -- scroll = { enabled = false },
      image = { enabled = true },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 25,
              },
            },
          },
        },
      },
    },
  },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- remove LuaSnip as a source from cmp
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "luasnip"
      end, opts.sources)
      -- disable snippet expansion
      opts.snippet = {
        expand = function() end,
      }
    end,
  },
}
