return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        width = .75,     -- width will be 85% of the editor width
        height = .90     -- height will be 85% of the editor height
      }
    }
  end
}
