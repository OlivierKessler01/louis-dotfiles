return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- format
      keys[#keys + 1] = { "<M-C-L>", "<cmd>lua vim.lsp.buf.format { async = true }<CR>" }
    end,
  },
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>vm", "<cmd>Mason<cr>", noremap = true, desc = "Open Mason" },
    },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      },
      ensure_installed = {
        "gopls",
        "angular-language-server",
        "ansible-language-server",
        "ansible-lint",
        "bash-language-server",
        "codelldb",
        "go-debug-adapter",
        "goimports",
        "golangci-lint",
        "google-java-format",
        "html-lsp",
        "java-debug-adapter",
        "java-test",
        "jdtls",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "rust-analyzer",
        "semgrep",
        "shellcheck",
        "shfmt",
        "sql-formatter",
        "terraform-ls",
        "typescript-language-server",
        "vscode-java-decompiler",
        "xmlformatter",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mason",
        callback = function()
          vim.api.nvim_set_hl(0, "MasonNormal", { bg = "none" })
          vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        end,
      })
    end,
  },
  -- ui for LSP features
  {
    "glepnir/lspsaga.nvim",
    keys = {
      {
        "]e",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to next (F2)",
      },
      {
        "<F2>",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to next (F2)",
      },
      {
        "[e",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to previous (Shift+F2)",
      },
      {
        "<F14>",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to previous (Shift+F2)",
      },
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to previous ERROR",
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic go to next ERROR",
      },
      {
        "<leader>ce",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic show message (Ctrl+F1)",
      },
      {
        "<F25>",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga diagnostic show message (Ctrl+F1)",
      },
      {
        "<leader>ch",
        "<cmd>Lspsaga hover_doc<cr>",
        noremap = true,
        silent = true,
        desc = "LSP show hovering help (Shift+k)",
      },
      {
        "<S-k>",
        "<cmd>Lspsaga hover_doc<cr>",
        noremap = true,
        silent = true,
        desc = "LSP show hovering help (Shift+k)",
      },
      {
        "<leader>cc",
        "<cmd>Lspsaga finder<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga definition and usage finder (Cltr+Alt+7)",
      },
      {
        "<M-&>",
        "<cmd>Lspsaga finder<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga definition and usage finder (Ctrl+Alt+7)",
      },
      -- NOTE: does not work for going into third party dependencies => use the one from Telescope
      -- {
      --   "<leader>cd",
      --   "<cmd>Lspsaga goto_definition<cr>",
      --   noremap = true,
      --   silent = true,
      --   desc = "Lspsaga go to definition (Ctrl+b)",
      -- },
      -- {
      --   "<C-b>",
      --   "<cmd>Lspsaga goto_definition<cr>",
      --   noremap = true,
      --   silent = true,
      --   desc = "Lspsaga go to definition (Ctrl+b)",
      -- },
      {
        "<leader>cD",
        "<cmd>Lspsaga peek_definition<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga peek definition",
      },
      {
        "<leader>ct",
        "<cmd>Lspsaga goto_type_definition<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga goto type definition",
      },
      {
        "<leader>cT",
        "<cmd>Lspsaga peek_type_definition<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga peek type definition",
      },
      {
        "<leader>ci",
        "<cmd>Lspsaga incoming_calls<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga incoming calls",
      },
      {
        "<leader>co",
        "<cmd>Lspsaga outgoing_calls<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga outgoing calls",
      },
      {
        "<leader>cm",
        "<cmd>Lspsaga outline<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga outline minimap (Ctrl+F12)",
      },
      {
        "<F36>",
        "<cmd>Lspsaga outline<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga outline minimap (Ctrl+F12)",
      },
      {
        "<leader>cr",
        "<cmd>Lspsaga rename ++project<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga rename (Shift+F6)",
      },
      {
        "<F18>",
        "<cmd>Lspsaga rename ++project<cr>",
        noremap = true,
        silent = true,
        desc = "Lspsaga rename (Shift+F6)",
      },
      {
        "<leader>cE",
        "<cmd>Lspsaga show_buf_diagnostics<cr>",
        noremap = true,
        silent = true,
        desc = "LSP show errors",
      },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<cr>",
        noremap = true,
        silent = true,
        desc = "LSP code action (Alt+Enter)",
      },
      {
        "<M-CR>",
        "<cmd>Lspsaga code_action<cr>",
        noremap = true,
        silent = true,
        desc = "LSP code action (Alt+Enter)",
      },
      {
        "<leader>cb",
        "<cmd>Lspsaga finder imp<cr>",
        noremap = true,
        silent = true,
        desc = "Goto implementation",
      },
      {
        "<M-C-B>",
        "<cmd>Lspsaga finder imp<cr>",
        noremap = true,
        silent = true,
        desc = "Goto implementation (Ctrl+Alt+b)",
      },
    },
    config = function()
      require("lspsaga").setup({
        callhierarchy = {
          layout = "normal",
          keys = {
            shuttle = { "<C-l>", "<C-h>" },
            toggle_or_req = { "o", "<cr>" },
            vsplit = "<C-v>",
            split = "<C-x>",
          },
        },
        finder = {
          layout = "normal",
          left_width = 0.4,
          keys = {
            shuttle = { "<C-l>", "<C-h>" },
            toggle_or_open = { "o", "<cr>" },
            vsplit = "<C-v>",
            split = "<C-x>",
          },
        },
        lightbulb = {
          sign = false,
        },
        rename = {
          in_select = false,
          auto_save = true,
          project_max_width = 0.8,
          project_max_height = 0.5,
        },
        ui = {
          border = "rounded",
        },
        symbol_in_winbar = {
          enable = false,
        },
      })

      -- change LSP saga highlight
      vim.api.nvim_set_hl(0, "HoverNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "HoverBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "SagaNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "SagaBorder", { bg = "none" })
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  -- java support
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
}
