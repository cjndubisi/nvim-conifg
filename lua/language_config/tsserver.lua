
local on_ready = function(server, on_attach, capabilities)
    if server.name ~= 'tsserver' then
      return function() end
    end
    server:setup({
      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
       
        local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_enable_code_actions = true,
            enable_formatting = true,
            formatter = "prettier",
        })
        local opt = { noremap=true, silent=true }
        ts_utils.setup_client(client)
        buf_map("n", "gs", ":TSLspOrganize<CR>", opt)
        buf_map("n", "gi", ":TSLspRenameFile<CR>", opt)
        buf_map("n", "go", ":TSLspImportAll<CR>", opt)
        
        on_attach(client, bufnr)
      end,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      capabilities = capabilities,
    })
end


M = {
  on_ready = on_ready
}

return M

