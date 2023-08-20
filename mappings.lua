---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.lspconfig = {
  n = {
    ["<leader>h"] = { "<cmd> ClangdSwitchSourceHeader<CR>", "switch between src/header", opts={ noremap = true, silent = true } },
  },
}

M.tabufline = {
  n = {
  -- closes tab + all of its buffers
    ["<leader>cx"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers",
    },
    -- closes all bufs except current one
    ["<leader>cb"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs ()
      end,
      "Close all buffers except current one",
    },
  },
}
-- more keybinds!

return M
