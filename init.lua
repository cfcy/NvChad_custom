local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- set whitespaces and show it
opt.listchars:append('eol:¶') -- eol:'↴'
opt.listchars:append('tab:» ')
opt.listchars:append('lead:·')
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

-- remove trailing whitespaces on saving file.
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
