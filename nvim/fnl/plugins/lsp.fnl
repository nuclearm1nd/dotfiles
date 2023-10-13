(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local util (autoload :config.util))

(util.keymap :n :<leader>lI ":LspInfo<CR>")

;symbols to show for lsp diagnostics
(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs "Diagnostic")

[{1 :neovim/nvim-lspconfig
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  handlers {"textDocument/publishDiagnostics"
                            (vim.lsp.with
                              vim.lsp.diagnostic.on_publish_diagnostics
                              {:severity_sort true
                               :update_in_insert true
                               :underline true
                               :virtual_text false})
                            "textDocument/hover"
                            (vim.lsp.with
                              vim.lsp.handlers.hover
                              {:border "single"})
                            "textDocument/signatureHelp"
                            (vim.lsp.with
                              vim.lsp.handlers.signature_help
                              {:border "single"})}
                  capabilities (cmplsp.default_capabilities)
                  before_init (fn [params]
                                (set params.workDoneToken :1))
                  on_attach
                    (fn [client bufnr]
                      (let [keymap (fn [mode from to ?opts]
                                     (nvim.buf_set_keymap bufnr mode from to
                                                          (util.merge {:noremap true} ?opts)))]
                        (do
                          (keymap :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
                          (keymap :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
                          (keymap :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>")
                          (keymap :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>")
                          (keymap :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                          (keymap :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>")
                          (keymap :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>")
                          (keymap :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>")
                          (keymap :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>")
                          (keymap :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>")
                          (keymap :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>")
                          (keymap :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>")
                          (keymap :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
                          ;telescope
                          (keymap :n :<leader>lw ":lua require('telescope.builtin').diagnostics()<CR>")
                          (keymap :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<CR>")
                          (keymap :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<CR>"))))

                  lua_settings
                    {:Lua
                      {:runtime     {:version :LuaJIT}
                       :diagnostics {:globals [:vim]}
                       :workspace   {:library (vim.api.nvim_get_runtime_file "" true)
                                     :checkThirdParty false}
                       :telemetry   {:enable false}}}
                  ]
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

              ;; Clojure
              (lsp.clojure_lsp.setup {:on_attach on_attach
                                      :handlers handlers
                                      :before_init before_init
                                      :capabilities capabilities})

              ;; Lua
              (lsp.lua_ls.setup
                {:on_attach on_attach
                 :handlers handlers
                 :capabilities capabilities
                 :settings lua_settings})

              ;; Fennel
              (lsp.fennel_ls.setup {})
              ))}]

