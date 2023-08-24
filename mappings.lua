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
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.disable()<CR>", "diable diagnostic", opts = { noremap = true, silent = true } },
    ["<leader>de"] = { "<cmd>lua vim.diagnostic.enable()<CR>", "enable diagnostic", opts = { noremap = true, silent = true } },
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

M.spectre = {
  plugin = true,

  n = {
    ["<leader>S"] = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle spectre" },
    ["<leader>sw"] = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word" },
    ["<leader>sp"] = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },
  },

  v = {
    ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word" },
  },
}

M.aerial = {
  plugin = true,

  n = {
    ["<leader>a"] = { '<cmd>AerialToggle!<CR>', "Toggle Aerial outline" },
  },
}

return M
