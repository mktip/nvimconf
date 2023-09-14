--
--   ░░░░░░░░░░░░░░░░░░░
--   ░░█▀█░█░█░▀█▀░█▄█░░
--   ░░█░█░▀▄▀░░█░░█░█░░
--   ░░▀░▀░░▀░░▀▀▀░▀░▀░░
--   ░░░░░░░░░░░░░░░░░░░
--

require("options").config()
require("keybind").config()
require("augroup").config()
require("lazypkg").config()
require("themeup").config()

-- needed but could be adjusted later with lazyloading
vim.opt.laststatus = 0
