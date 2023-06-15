(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp
             util config.util}})

(util.keymap :n :<leader>lI ":LspInfo<CR>")

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
                  (let [keymap (fn [mode from to ?opts]
                                 (nvim.buf_set_keymap bufnr mode from to
                                                      (util.merge {:noremap true} ?opts)))]
                    (keymap :n :gd         "<cmd>lua vim.lsp.buf.definition()<CR>")
                    (keymap :n :K          "<cmd>lua vim.lsp.buf.hover()<CR>")
                    (keymap :n :<leader>ld "<cmd>lua vim.lsp.buf.declaration()<CR>")
                    (keymap :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>")
                    (keymap :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                    (keymap :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>")
                    (keymap :n :<leader>lf "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
                    (keymap :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>")
                    (keymap :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>")
                    (keymap :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>")
                    (keymap :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>")
                    ;telescope
                    (keymap :n :<leader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>")
                    (keymap :v :<leader>la ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>")
                    (keymap :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>")
                    (keymap :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>")
                    (keymap :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>")))

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

