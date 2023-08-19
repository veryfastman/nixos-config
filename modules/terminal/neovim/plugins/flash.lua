local opts = { noremap = true, silent  = true }

vim.keymap.set({"n", "x", "o"}, "s", function() require("flash").jump() end, opts)
vim.keymap.set({"n", "o", "x"}, "S", function() require("flash").treesitter() end, opts)
vim.keymap.set("o", "r", function() require("flash").remote() end, opts)
vim.keymap.set({"o", "x"}, "R", function() require("flash").treesitter_search() end, opts)
vim.keymap.set("c", "<C-s>", function() require("flash").toggle() end, opts)
