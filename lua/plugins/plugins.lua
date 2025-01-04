return {
  { "olimorris/onedarkpro.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local clangd
      local esp_idf_path = os.getenv("IDF_PATH")
      if esp_idf_path then
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=/home/tommaso/.espressif/tools/riscv32-esp-elf/esp-13.2.0_20240530/riscv32-esp-elf/bin/*,"
              .. "/home/tommaso/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/bin/*",
          },
        }
      else
        clangd = {
          cmd = {
            "clangd-19",
            "--query-driver=/usr/bin/arm-none-eabi-*,/usr/bin/gcc-*,/usr/bin/avr*",
          },
        }
      end
      opts.servers = vim.tbl_extend("force", opts.servers or {}, {
        clangd = clangd,
      })
    end,
  },
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
  },
}
