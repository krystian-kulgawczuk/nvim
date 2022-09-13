require("toggleterm").setup()

local opts = { buffer = 0 }

function _G.set_terminal_keymaps()
  vim.keymap.set("t", "<C-p>", [[<Cmd>lua require('Navigator').previous()<CR>]], opts)
  vim.keymap.set("t", "<C-n>", [[<Cmd>ToggleTerm<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.keymap.set("n", "<C-n>", ":ToggleTerm<CR>", opts)
