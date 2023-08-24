-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
  M.override = { Comment = { italic = true, },
  Type = { fg = "green", },
  StorageClass = { fg = "cyan", },
  Label = { fg = "red", },
  ["@punctuation.bracket"] = { fg = "pink", },
  ["@punctuation.delimiter"] = { fg = "#93a1a1", },
  ["@keyword"] = { fg = "cyan", },
  ["@parameter"] = { fg = "#93a1a1", },
  ["@property"] = { fg = "#93a1a1", },
  ["@string"] = { fg = "grey", },
  ["@type.builtin"] = { fg = "cyan", },
  ["@character"] = { fg = "teal", },
  ["@constant"] = { fg = "teal", },
  ["@constant.macro"] = { fg = "teal", },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
