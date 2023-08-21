return {
  -- debugger engine
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F9>",
        "<Cmd>lua require('dap').continue()<cr>",
        noremap = true,
        silent = true,
        desc = "Begin debug session (F9)",
      },
      {
        "<leader>db",
        "<Cmd>lua require('dap').continue()<cr>",
        noremap = true,
        silent = true,
        desc = "Begin debug session (F9)",
      },
      {
        "<F4>",
        "<Cmd>lua require('dap').close()<cr>",
        noremap = true,
        silent = true,
        desc = "End debug session (F4)",
      },
      {
        "<leader>de",
        "<Cmd>lua require('dap').close()<cr>",
        noremap = true,
        silent = true,
        desc = "End debug session (F4)",
      },
      {
        "<F32>",
        "<Cmd>lua require('dap').toggle_breakpoint()<cr>",
        noremap = true,
        silent = true,
        desc = "Toggle breakpoint (Ctrl+F8)",
      },
      {
        "<leader>dt",
        "<Cmd>lua require('dap').toggle_breakpoint()<cr>",
        noremap = true,
        silent = true,
        desc = "Toggle breakpoint (Ctrl+F8)",
      },
      {
        "<F8>",
        "<Cmd>lua require('dap').step_over()<cr>",
        noremap = true,
        silent = true,
        desc = "Step over (F8)",
      },
      {
        "<leader>dv",
        "<Cmd>lua require('dap').step_over()<cr>",
        noremap = true,
        silent = true,
        desc = "Step over (F8)",
      },
      {
        "<F7>",
        "<Cmd>lua require('dap').step_into()<cr>",
        noremap = true,
        silent = true,
        desc = "Step into (F7)",
      },
      {
        "<leader>di",
        "<Cmd>lua require('dap').step_into()<cr>",
        noremap = true,
        silent = true,
        desc = "Step into (F7)",
      },
      {
        "<F20>",
        "<Cmd>lua require('dap').step_out()<cr>",
        noremap = true,
        silent = true,
        desc = "Step out (Shift+F8)",
      },
      {
        "<leader>do",
        "<Cmd>lua require('dap').step_out()<cr>",
        noremap = true,
        silent = true,
        desc = "Step out (Shift+F8)",
      },
    },
  },
  -- dap UI
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<M-5>",
        "<cmd>lua require('dapui').toggle({ reset = true })<cr>",
        desc = "Open DAP UI (Alt+5)",
      },
      {
        "<leader>du",
        "<cmd>lua require('dapui').toggle({ reset = true })<cr>",
        desc = "Open DAP UI (Alt+5)",
      },
    },

    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      -- NOTE: no need to close DAP config when finished
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close({})
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close({})
      -- end
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>dc",
        "<cmd>Telescope dap configurations<cr>",
        noremap = true,
        silent = true,
        desc = "Telescope DAP configuration",
      },
    },
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    },
  },
}
