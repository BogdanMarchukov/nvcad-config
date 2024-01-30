---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["\\"] = { "<cmd>:vsplit <CR>", "Vertical split" },
    ["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
    ["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" },
    ["<leader>w"] = { "<cmd>w<CR>", "Save" },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<leader>tt"] = {
      function()
        require("neotest").run.run()
      end,
      "Run nearest test",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run file test",
    },
    ["<leader>to"] = {
      ":Neotest output<CR>",
      "Test output",
    },
    ["<leader>ts"] = {
      ":Neotest summary<CR>",
      "Test summary",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Dedug UI",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Breakpoint",
    },
    ["<leader>ds"] = {
      function()
        require("dap").continue()
      end,
      "Start",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },

    ["<leader>ls"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      desc = "Search symbols",
    },
    ["<leader>la"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
