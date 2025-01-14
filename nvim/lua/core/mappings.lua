-- mappings.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- -- Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -- Swap colon and semicolon.
-- keymap("", ";", ":", opts)
-- keymap("", ":", ";", opts)

-- -- Clear highlighting..
-- keymap("n", "<CR>", ":noh<CR>", opts)
-- keymap("n", "<Esc>", ":noh<Esc>", opts)

-- Tab navigation.
keymap("n", "<tab>", ":tabnext<CR>", opts)
keymap("n", "<S-tab>", ":tabprevious<CR>", opts)

-- Visual mode persistent indenting.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down when visually selected.
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Format (Neoformat)
keymap("n", "<leader>f", ":Neoformat <CR>", opts)
vim.cmd([[
  let g:neoformat_python_pyfmt = {'exe': 'pyfmt', 'args': ['format'], 'replace': 1}
  let g:neoformat_python_tidy = {'exe': 'tidy-imports', 'args': ['--black', '--quiet', '--replace-star-imports', '--action REPLACE'], 'replace': 1}
  let g:neoformat_enabled_python = ['tidy', 'pyfmt']
  let g:neoformat_run_all_formatters = 1
  let g:neoformat_only_msg_on_error = 0
]])

-- LSP 
vim.keymap.set("n", "?", vim.diagnostic.open_float, opts)

-- Telescope
keymap(
	"n",
	"f",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "s", "<cmd>Telescope live_grep<cr>", opts) --Searches in current directory
keymap("n", "<leader>ss", "<cmd>lua require('telescope.builtin').live_grep({cwd=os.getenv('HOME')..'/work/src2/platform/'})<cr>", opts) -- search in src2
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts) -- search buffers
keymap("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files({cwd=os.getenv('HOME')..'/work/src2/platform/'})<cr>", opts) -- search buffers

keymap(
  "n",
  "<leader>tg",
  "<cmd>:FloatermNew --cwd=./ lazygit<cr>", opts
)
keymap(
  "n",
  "<leader>tt",
  "<cmd>:FloatermNew pytest -v %:p<cr>", opts
)
keymap(
  "n",
  "<leader>th",
  "<cmd>:FloatermHide <cr>", opts
)
keymap(
  "n",
  "<leader>ts",
  "<cmd>:FloatermShow <cr>", opts
)



-- Magma
vim.cmd([[
  " nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
  nnoremap <silent> <leader><Enter> :MagmaEvaluateLine<CR>
  xnoremap <silent> <leader>r  :<C-u>MagmaEvaluateVisual<CR>
  nnoremap <silent> <leader>rc :MagmaReevaluateCell<CR>
  nnoremap <silent> <leader>rd :MagmaDelete<CR>
  nnoremap <silent> <leader>o :MagmaShowOutput<CR>
  nnoremap <silent> <leader>i :MagmaInit python3<CR>

  " moving between different keymaps (note this is Mac specific b/c how inserted chars work)
  nnoremap ˙ <C-W>h
  nnoremap ∆ <C-W>j
  nnoremap ˚ <C-W>k
  nnoremap ¬ <C-W>l

  let g:magma_automatically_open_output = v:false
  let g:magma_image_provider = "kitty"
]])
