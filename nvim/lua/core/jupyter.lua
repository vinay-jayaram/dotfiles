-- jupyter.lua
-- Native .ipynb editing via jupynvim (Rust backend, terminal graphics).

local jupynvim_dir = vim.fn.stdpath("config") .. "/site/pack/packer/start/jupynvim"

-- packer's run hook installs the backend, but it only fires on install/update.
-- Keep a manual escape hatch for when the binary goes missing or stale.
vim.api.nvim_create_user_command("JupynvimInstallCore", function()
	require("jupynvim.backend.install").run({ dir = jupynvim_dir })
end, { desc = "Download or build the jupynvim Rust backend" })

require("jupynvim").setup({
	log_level = "info",
	-- Ghostty 1.3+ implements Kitty graphics with the Unicode placeholders
	-- jupynvim needs, so plots render as real PNGs. 'placeholder' (upstream's own
	-- default) auto-cleans and survives tmux; 'kitty' uses direct placement at
	-- fixed screen coords; 'chafa' is ASCII art for terminals without graphics.
	image_renderer = "placeholder",
})
