local tree = require("nvim-tree")
tree.setup({
  sort_by = "case_sensitive",
  view = {
    side = "left",
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})
