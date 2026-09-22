require("tokyonight").setup({
	style = "night",
	-- Current tokyonight takes highlight-attribute tables here; the old string
	-- form ("italic" / "NONE") reaches nvim_set_hl as `style` and errors.
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
  lualine_bold = true,
})
-- No `set notermguicolors` here: options.lua turns termguicolors on, and
-- undoing it right before the colorscheme loads dropped tokyonight to a
-- 256-color approximation. Ghostty does truecolor, so let it.
vim.cmd([[colorscheme tokyonight-night]])
