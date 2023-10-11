require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'vim', 'vimdoc', 'lua', 'cpp', 'query' },
  auto_install = true,
  highlight = { enable = true },
  context_commentstring ={enable = true, enable_autocmd = false},
  indent = { enable = true },
}
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
