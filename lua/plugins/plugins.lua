return {
  { "olimorris/onedarkpro.nvim", lazy = false },
  { "ellisonleao/gruvbox.nvim" },
  { "projekt0n/github-nvim-theme" },
  --[[{
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
  },]]
  {
    "folke/snacks.nvim",
    opts = {
      -- scroll = { enabled = false },
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
