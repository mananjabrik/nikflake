require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
		side="left"
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true, nowait = true })
