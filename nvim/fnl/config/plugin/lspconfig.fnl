(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

(nvim.set_keymap :n :<leader>lI ":LspInfo<CR>" {:noremap true})

(vim.fn.sign_define "DiagnosticSignError" {:text "" :texthl "DiagnosticSignError"})
(vim.fn.sign_define "DiagnosticSignWarn"  {:text "" :texthl "DiagnosticSignWarn"})
(vim.fn.sign_define "DiagnosticSignInfo"  {:text "" :texthl "DiagnosticSignInfo"})
(vim.fn.sign_define "DiagnosticSignHint"  {:text "" :texthl "DiagnosticSignHint"})

;server features
(let [handlers
        {:textDocument/publishDiagnostics
           (vim.lsp.with
             vim.lsp.diagnostic.on_publish_diagnostics
             {:severity_sort true
              :signs true
              :update_in_insert false
              :underline false
              :virtual_text false})
         :textDocument/hover
            (vim.lsp.with
              vim.lsp.handlers.hover
              {:border :single})
         :textDocument/signatureHelp
           (vim.lsp.with
             vim.lsp.handlers.signature_help
             {:border :single})}
      capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format({async = true})<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
                    ;telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>la ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))

      lua_settings {:Lua
                     {:runtime     {:version :LuaJIT}
                      :diagnostics {:globals [:vim]}
                      :workspace   {:library (vim.api.nvim_get_runtime_file "" true)
                                    :checkThirdParty false}
                      :telemetry   {:enable false}}}]

  ;; Clojure
  (lsp.clojure_lsp.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities})

  ;; Lua
  (lsp.lua_ls.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities
     :settings lua_settings})

  ;; CSS
  (lsp.cssls.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities}))

