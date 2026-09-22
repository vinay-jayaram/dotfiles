-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- vars.lua appends the packer site dir to 'packpath', so it has to run before
-- anything caches the module search paths.
require("vars")

-- Nvim 0.9+ built-in module cache (replaces impatient.nvim). Enabled only now:
-- vim.loader builds its index on the first require() and does not notice
-- 'packpath' changes made afterwards, which would hide packer from require().
vim.loader.enable()

require("core.plugins")
require("core.options")
require("core.mappings")

-- Everything below needs plugins on the runtimepath. On a fresh clone they are
-- not there yet, so load them protectively: the editor still comes up usable
-- and `:PackerSync` can fix things, rather than aborting init.lua on line one.
local function load(mod)
	local ok, err = pcall(require, mod)
	if not ok then
		vim.notify(("failed to load %s: %s"):format(mod, err), vim.log.levels.WARN)
	end
	return ok
end

load("core.colorscheme")
load("core.cmp")
load("core.lsp")
load("core.statusline")
load("core.telescope")
load("core.treesitter")
load("core.claude")
load("core.jupyter")

if load("notify") then
	vim.notify = require("notify")
end

-- not sure why this is necessary?/
pcall(function()
	require("nvim-surround").setup()
end)
