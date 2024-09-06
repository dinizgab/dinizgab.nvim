require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "go", "vimdoc", "sql", "python", "yaml", "rust", "java", "markdown" },
  autotag = {
    enable = true,
  },
  highlight = {
 	enable = true
  }
}

