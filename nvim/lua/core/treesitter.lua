local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- Was "all", which compiles 200+ grammars on first start and takes tens of
  -- minutes. Explicit list instead; add languages as you need them.
  ensure_installed = {
    "python", "lua", "c", "cpp", "rust", "go",
    "bash", "json", "yaml", "toml", "markdown", "markdown_inline",
    "html", "css", "javascript", "typescript", "tsx",
    "git_config", "gitcommit", "gitignore", "diff",
    "query", "vim", "vimdoc", "regex", "sql", "dockerfile",
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = { enable = true, disable = { "yaml" } },
}
