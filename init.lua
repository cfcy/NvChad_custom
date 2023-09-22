local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- set leader to ',' instead of space.
g.mapleader = ","

-- set whitespaces and show it
opt.listchars:append('eol:¶') -- eol:'↴'
opt.listchars:append('tab:» ')
opt.listchars:append('lead:·')
opt.listchars:append('space:·')
opt.listchars:append('trail:▫')
opt.listchars:append('extends:❯')
opt.listchars:append('precedes:❮')
opt.listchars:append('nbsp:␣')
opt.list = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- show margin column
opt.colorcolumn = { 128 }

-- set case sensitive.
opt.ignorecase = false

--show relavtive line number
opt.rnu = true

-- remove trailing whitespaces on saving file.
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- disable diagnostic.
vim.diagnostic.disable()

-- force c filetype for .h header file.
autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  callback = function()
    vim.bo.filetype = "c"
  end
})

--TODO: below cursor cfgs do not take effect.
--[[ -- cursor type and size
vim.opt.guicursor = {
  'n-v-c-sm:block',
  'i-ci-ve:ver25',
  'r-cr-o:hor20'
}
-- Inverted cursor
vim.cmd [[highlight Cursor guifg=NONE guibg=NONE gui=reverse]]

-- Camouflage cursor
--vim.cmd [[highlight Cursor guifg=bg guibg=fg gui=NONE]]
--]]
