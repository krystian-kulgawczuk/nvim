local wk = require("which-key")
local default_options = { silent = true }

-- Register all leader based mappings
wk.register({
  ["<Tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
  ["<leader>"] = {
    name = "Leader",
    a = { "<cmd>lua print('fasfAS')<cr>", "test" },
  },
  f = {
    name = "Files",
    b = { "<cmd>Telescope file_browser<cr>", "File browser" },
    g = { "<cmd>NvimTreeFindFile<cr>", "Find in tree" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    p = { "<cmd>NvimTreeToggle<cr>", "Toggle Filetree" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    a = { "<cmd>wa<cr>", "Save all Buffers" },
    s = { "<cmd>w<cr>", "Save Buffer" },
    z = { "<cmd>Telescope zoxide list<CR>", "Zoxide" },
  },
  m = {
    name = "Misc",
    c = { "<cmd>CheatSH<cr>", "Cht.sh" },
    p = { "<cmd>PackerSync<cr>", "PackerSync" },
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
  },
  s = {
    name = "Search",
    f = { "<cmd>Telescope find_files<cr>", "Search Files" },
    h = { "<cmd>Telescope help_tags<cr>", "Search Help" },
    w = { "<cmd>Telescope grep_string<cr>", "Search current Word" },
    g = { "<cmd>Telescope live_grep<cr>", "Search by Grep" },
    d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
  },
  g = {
    name = "Git",
    b = { "<cmd>:GitBlameToggle<cr>", "Blame" },
  },
  q = {
    name = "Quit",
    q = { "<cmd>xa<cr>", "Safe Quit" },
    s = { "<cmd>qa<cr>", "Quit with Buffer Check" },
    z = { "<cmd>qa<cr>", "Force quit" },
  }
}, { prefix = "<leader>", mode = "n", default_options })
