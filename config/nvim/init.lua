-- in 2025 use this file for all new configs and eventually deprecate init.vim!
-- for now keep loading
local vimrc = vim.fn.stdpath("config") .. "/init.vim"
vim.cmd.source(vimrc)

-- Add [count] blank lines above the cursor
vim.keymap.set("n", "[<space>", function()
  local count = vim.v.count1
  vim.cmd('call append(line(".")-1, repeat([""], ' .. count .. ")")
end, { noremap = true, silent = true })
-- Add [count] blank lines below the cursor
vim.keymap.set("n", "]<space>", function()
  local count = vim.v.count1
  vim.cmd('call append(line("."), repeat([""], ' .. count .. ")")
end, { noremap = true, silent = true })
