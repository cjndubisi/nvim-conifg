if !exists('g:lspconfig')  
  finish
endif

lua << EOF
vim.lsp.set_log_level("trace")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local lsp_installer = require("nvim-lsp-installer")
local config = require('core.on_attach_common')
local on_attach = config.on_attach
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local handle_lsp = function(opts) return opts end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local util = require "lspconfig/util"
local dlsConfig = require('language_config.diagnosticsls')
local eslintConfig = require('language_config.eslint')
local tsConfig = require('language_config.tsserver')

dlsConfig.on_attach = on_attach
eslintConfig.on_attach = on_attach

lsp_installer.on_server_ready(function(server)
    
    if server.name == 'diagnosticls' then 
      server:setup(dlsConfig)
    end

    if server.name == 'eslint' then
      eslintConfig.on_attach = function (client, bufnr)
        -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
        -- the resolved capabilities of the eslint server ourselves!
        client.resolved_capabilities.document_formatting = true
        on_attach(client, bufnr)
      end
      server:setup(eslintConfig)
    end
    if server.name == 'tsserver' then
      tsConfig.on_ready(server, on_attach, capabilities)
    end

end)

require("flutter-tools").setup(handle_lsp({
   lsp = {
    on_attach = on_attach
    },
    debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function(_)
      require("dap").configurations.dart = {}
    end,
    },
  }
))
---------

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  --  This sets the spacing and the prefix, obviously.
   virtual_text = {
     spacing = 4,
     prefix = ''
    }
  }
)


EOF
