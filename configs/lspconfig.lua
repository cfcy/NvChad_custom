local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Enable clangd for C
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,

  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes"
  },
  -- Enable based on filetype
  filetypes = {"c", "cpp"},

  -- single file support
  single_file_support = true,

  -- Single root project
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "build", ".cproject", ".project") or
             lspconfig.util.find_git_root() or
             lspconfig.util.find_node_modules_root() or
             lspconfig.util.find_package_json_root();
}

-- 
-- lspconfig.pyright.setup { blabla}
