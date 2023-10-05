return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require 'colorizer'.setup {
      'css',
      'javascript',
      'sh',
      'tmux',
      html = {
        mode = 'foreground',
      }
    }
  end

}
