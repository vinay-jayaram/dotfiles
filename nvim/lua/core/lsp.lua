-- lsp.lua
--
-- This module was gitignored in earlier revisions of this repo, so it never
-- made it into version control. Rewritten against the Nvim 0.11+ API:
-- nvim-lspconfig now ships each server's defaults as `lsp/<name>.lua` on the
-- runtimepath, so vim.lsp.config() only has to add what we want on top and
-- vim.lsp.enable() turns it on.

-- Advertise nvim-cmp's completion capabilities, since core/cmp.lua uses the
-- nvim_lsp source.
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	vim.lsp.config("*", { capabilities = cmp_lsp.default_capabilities() })
end

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			-- ruff handles the lint pass; keep basedpyright on types only.
			analysis = { typeCheckingMode = "standard" },
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			-- Stops the "Undefined global `vim`" warnings in this config.
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

-- server name -> executable it needs. A server whose binary is missing stays
-- off, so this config works on a machine without every toolchain installed.
local servers = {
	basedpyright = "basedpyright-langserver",
	ruff = "ruff",
	lua_ls = "lua-language-server",
	clangd = "clangd",
}

for server, exe in pairs(servers) do
	if vim.fn.executable(exe) == 1 then
		vim.lsp.enable(server)
	end
end

-- Diagnostics: mappings.lua binds `?` to open the float, so keep the inline
-- virtual text off and let the float carry the detail.
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	severity_sort = true,
	float = { border = "rounded", source = true },
})
