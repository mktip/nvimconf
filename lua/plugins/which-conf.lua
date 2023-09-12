function rename_file()
  local old_name = vim.fn.expand("%:p")
  local new_name = vim.fn.input("New name: ", old_name, "file")
  if new_name ~= "" then
    vim.fn.rename(old_name, new_name)
    vim.cmd("edit " .. new_name)
  end
end

function create_note()
  local new_name = vim.fn.input("New note title: ")
  require("zk").new({ title = new_name })
end

local config = function()
  local wk = require("which-key")

  wk.setup({ plugins = { spelling = { enabled = true } } })

  wk.register({
    u = { name = "+util", n = { "<cmd>nohlsearch<CR>", "Unhighlight Search" } },
    e = {
      name = "+edit",
      r = {
        '<cmd>lua require(\'telescope.builtin\').find_files({search_dirs = {"~/.config/nvim/"}})<CR>',
        "Edit Nvim"
      },
      c = {
        '<cmd>lua require(\'telescope.builtin\').find_files({search_dirs = {"~/.config/"}})<CR>',
        "Edit Config"
      },
      t = {
        '<cmd>lua require(\'telescope.builtin\').find_files({search_dirs = {"~/docs/todo/"}})<CR>',
        "Edit Todos"
      },
      i = {
        '<cmd>lua require(\'telescope.builtin\').find_files({search_dirs = {"~/docs/tils/"}})<cr>',
        "edit til"
      },
      m = { "<cmd>ZkNotes<CR>", "Open mind map" },
      n = { create_note, "Create a new note" }


    },
    b = {
      name = "+buff",
      b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Find Buffer" },
      g = {
        "<cmd>lua require('telescope.builtin').live_grep()<CR>",
        "Grep In Buffer"
      }
    },
    f = {
      name = "+file",
      f = {
        "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File"
      },
      r = { rename_file, "Rename File" },
      c = {
        "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
        "Open Recent File"
      },
      n = { "<cmd>enew<cr>", "New File" }
    },
    g = {
      name = "+lsp",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Jump To Definition" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      l = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    ["<leader>"] = { "", "Alternate Buffer" }
  }, { prefix = "<space>" })
end

return { "folke/which-key.nvim", config = config }
