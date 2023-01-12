-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("vars")
require("core.plugins")
require("impatient")
require("core.options")
require("core.mappings")
require("core.colorscheme")
require("core.cmp")
require("core.lsp")
require("core.statusline")
require("core.telescope")
require("core.treesitter")
vim.notify = require("notify")
-- not sure why this is necessary?/
require('nvim-surround').setup()
