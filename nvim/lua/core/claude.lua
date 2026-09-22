-- claude.lua
-- Claude Code in Neovim. Keymaps live in core/mappings.lua with the rest.

local claude_bin = vim.fn.exepath("claude")
if claude_bin == "" then
	claude_bin = vim.fn.expand("~/.local/bin/claude")
end

require("claudecode").setup({
	terminal_cmd = claude_bin,
	terminal = {
		-- The previous config used snacks.nvim's terminal; this config has no
		-- snacks, so use the built-in provider rather than letting "auto"
		-- silently pick whatever happens to be installed.
		provider = "native",
	},
})

-- Add the file under the cursor to Claude's context from a file listing.
-- Buffer-local, because <leader>as sends the visual selection everywhere else.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
	callback = function(args)
		vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", {
			buffer = args.buf,
			desc = "Add file to Claude",
			silent = true,
		})
	end,
})
