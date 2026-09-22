-- statusline.lua
--
-- Also gitignored in earlier revisions and so never committed. lualine, themed
-- to match core/colorscheme.lua.

require("lualine").setup({
	options = {
		theme = "tokyonight",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {
			{ "diagnostics", sources = { "nvim_diagnostic" } },
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
