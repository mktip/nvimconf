
local M = {}

M.config = function()
  vim.cmd([[ colorscheme catppuccin ]])
  vim.o.background="light"

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
