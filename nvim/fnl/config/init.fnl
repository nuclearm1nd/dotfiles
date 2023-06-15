(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; Generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(defn- set-flags [flags]
  (each [_ flag (ipairs flags)]
    (nvim.ex.set flag)))

(defn- set-options [options]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

(set-flags
  [:hidden     ;; Allow hidden buffers
   :number     ;; Show line numbers
   :splitright ;; Open new splits right and at bottom
   :splitbelow
   :expandtab  ;; Expand TABs to spaces
   :nowrap     ;; Don't wrap lines
   :ttyfast    ;; Mouse support
   ])

;; Sets nvim global options
(set-options
  {;:completeopt "menuone,noselect" ;; Settings needed for compe autocompletion
   ;:clipboard "unnamedplus" ;; Shared clipboard with linux
   :mouse "a" ;; Mouse support
   :tabstop 2
   :shiftwidth 2
   :softtabstop 2
  })

(fn _G.toggle_signcolumn []
  (if (= nvim.wo.signcolumn "no")
    (set nvim.wo.signcolumn "auto")
    (set nvim.wo.signcolumn "no")))

(def- keymap util.keymap)

(keymap :n :<leader>tt ":call v:lua.toggle_signcolumn()<CR>" {:silent true})

;; Mappings
(keymap :n :<leader>ev ":vsp ~/.dotfiles/nvim/fnl/config/init.fnl<CR>")
(keymap :n :<c-d> "yyp")
(keymap :i :<c-d> "<esc>yypi")
(keymap :n :<c-k> "<esc>^hvk$d")
(keymap :i :<c-k> "<esc>^hvk$di")
(keymap :n :<c-c> "<esc>vk$c")
(keymap :n :<c-del> "<esc>VG$dzb")

(keymap :n :<leader>ch ":checkhealth<CR>")
(keymap :n :<leader>an ":e ~/docs/notes/")

;; Packer
(keymap :n :<leader>pu ":PackerUpdate<CR>")
(keymap :n :<leader>pi ":PackerInstall<CR>")
(keymap :n :<leader>pc ":PackerClean<CR>")

;; Import plugins
(require :config.plugins)

