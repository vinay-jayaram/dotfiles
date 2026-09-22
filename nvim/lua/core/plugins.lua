-- plugins.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- Use a protected call in case packer is not installed.
local packer = require("packer")
--if not status_ok then
--	return
--end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
 })

packer.startup({
	function(use)
		-- impatient.nvim used to live here; Nvim 0.9+ ships the same module
		-- cache as vim.loader, enabled in init.lua.

		use("wbthomason/packer.nvim") -- Have packer manage itself.
		use("nvim-lua/popup.nvim") -- An implementation of the Popup API in neovim.
		use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins.

		-- Pinned to master: the default `main` branch drops :TSUpdate and the
		-- nvim-treesitter.configs module that core/treesitter.lua sets up.
		use({
			"nvim-treesitter/nvim-treesitter", -- treesitter support
			branch = "master",
			run = ":TSUpdate",
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("ibl").setup()
			end,
		})

		use("hrsh7th/nvim-cmp") -- Completion Engine
		use("hrsh7th/cmp-path") -- [cmp] path source
		use("hrsh7th/cmp-buffer") -- [cmp] buffer source
		use("hrsh7th/cmp-cmdline") -- [cmp] cmdline source?
		--		use("saadparwaiz1/cmp_luasnip") -- snippet completions

		use("hrsh7th/cmp-nvim-lsp") -- [cmp] LSP source
		use("hrsh7th/cmp-nvim-lua") -- [cmp] neovim-lua completions
		use("onsails/lspkind-nvim") -- adds symbols to LSP completion

		use("neovim/nvim-lspconfig") -- LSP
		-- nvim-lsp-installer was here; upstream is archived (superseded by
		-- mason.nvim). core/lsp.lua enables servers already on PATH instead.

		use("nvim-telescope/telescope.nvim") -- Fuzzy Finding
		--		use("nvim-telescope/telescope-dap.nvim")
		use("sbdchd/neoformat") -- yapf formatting

		use("rcarriga/nvim-notify")

		use("folke/tokyonight.nvim") -- colorscheme

		use({
			"numToStr/Comment.nvim", -- commenting plugin
			config = function()
				require("Comment").setup()
			end,
		})
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup()
    end
    })
    use({'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup({})
    end
    })
		use({
			"lewis6991/gitsigns.nvim", -- git signs
			config = function()
				require("gitsigns").setup()
			end,
		})

    -- Vimscript plugin, configured through g:floaterm_* vars -- there is no
    -- lua module to require, so no config function here.
    use("voldikss/vim-floaterm") -- floatterm for lazygit

		use("coder/claudecode.nvim") -- Claude Code in Neovim

		-- Jupyter notebooks (.ipynb) edited natively. The Rust backend is not
		-- shipped in the repo; packer's run hook fetches the prebuilt binary
		-- (verified against the release SHA256SUMS), falling back to cargo.
		use({
			"sheng-tse/jupynvim",
			run = function()
				require("jupynvim.backend.install").run({
					dir = vim.fn.stdpath("config") .. "/site/pack/packer/start/jupynvim",
				})
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		use({
			"akinsho/toggleterm.nvim",
			tag = "v2.*",
			config = function()
				require("toggleterm").setup({
          size = 20,
          open_mapping = [[<c-t>]],
        })
			end,
		})
	end,
config = {
  package_root = vim.fn.stdpath('config') .. '/site/pack'
}
})

