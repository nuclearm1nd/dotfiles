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
   :autowrite  ;; Automatically write a file when leaving a modified buffer
   :mousehide  ;; Hide the mouse cursor while typing
   ])

;; Sets nvim global options
(set-options
  {;:completeopt "menuone,noselect" ;; Settings needed for compe autocompletion
   ;:clipboard "unnamedplus" ;; Shared clipboard with linux
   :mouse "a" ;; Mouse support
   :tabstop 2
   :shiftwidth 2
   :softtabstop 2
   ;:shortmess "atOI"  ;; no help startup screen
   :scrolloff 3
   :listchars "tab:→\\ ,eol:↵,trail:·,extends:↷,precedes:↶"
  })

(fn _G.toggle_signcolumn []
  (if (= nvim.wo.signcolumn "no")
    (set nvim.wo.signcolumn "auto")
    (set nvim.wo.signcolumn "no")))

(fn _G.toggle_nonprintable_characters []
  (if (= nvim.o.list true)
    (set nvim.o.list false)
    (set nvim.o.list true)))

(def- keymap util.keymap)

(keymap :n :<leader>tt ":call v:lua.toggle_signcolumn()<CR>" {:silent true})
(keymap :n :<leader>tc ":call v:lua.toggle_nonprintable_characters()<CR>" {:silent true})

;; Mappings
; (keymap :n :<c-k> "<esc>^hvk$d")
; (keymap :i :<c-k> "<esc>^hvk$di")
; (keymap :n :<c-c> "<esc>vk$c")
; (keymap :n :<leader>ev ":vsp ~/.dotfiles/nvim/fnl/config/init.fnl<CR>")

(keymap :v :<c-c> "\"+y")
(keymap :n :<c-s-v> "<esc>\"+p")
(keymap :i :<c-v> "<esc>\"+pi")

(keymap :n :<c-d> "yyp")
(keymap :i :<c-d> "<esc>yypi")
(keymap :n :<c-del> "<esc>VG$dzb")

(keymap :v :> ">gv")
(keymap :v :< "<gv")

(keymap :n "\\" ",")

(keymap :n :j :gj)
(keymap :n :k :gk)
(keymap :v :j :gj)
(keymap :v :k :gk)

(keymap :n :gj :j)
(keymap :n :gk :k)
(keymap :v :gj :j)
(keymap :v :gk :k)

(keymap :n :w :W)
(keymap :n :W :w)
(keymap :v :w :W)
(keymap :v :W :w)
(keymap :o :iw :iW)
(keymap :o :iW :iw)
(keymap :o :aw :aW)
(keymap :o :aW :aw)

(keymap :n :b :B)
(keymap :n :B :b)
(keymap :v :b :B)
(keymap :v :B :b)
(keymap :o :b :B)
(keymap :o :B :b)

(keymap :n :e :E)
(keymap :n :E :gE)
(keymap :v :e :E)
(keymap :v :E :gE)
(keymap :o :e :E)
(keymap :o :E :gE)

(keymap :v :v "<Esc>")
(keymap :n :H "^")
(keymap :v :H "^")
(keymap :o :H "^")
(keymap :n :L "$")
(keymap :v :L "$")
(keymap :o :L "$")
(keymap :n :Y "y$")
(keymap :v :Y "y$")
(keymap :o :Y "y$")

(keymap :n :U "<C-r>")

(keymap :n :<leader>sc ":nohlsearch<CR>" {:silent true})

(keymap :n "[b" ":bprevious<CR>" {:silent true})
(keymap :n "]b" ":bnext<CR>" {:silent true})
; (keymap :n :<leader>bd ":bd<CR>" {:silent true})

(keymap :n :<leader>ww "<c-w>k<c-w>o")

(keymap :n :<leader>ch ":checkhealth<CR>")
; (keymap :n :<leader>an ":e ~/docs/notes/")

;; Packer
(keymap :n :<leader>pu ":PackerUpdate<CR>")
(keymap :n :<leader>pi ":PackerInstall<CR>")
(keymap :n :<leader>pc ":PackerClean<CR>")

;; Open help window in a vertical split to the right
(vim.api.nvim_create_autocmd
  [:BufWinEnter]
  {:group (vim.api.nvim_create_augroup "help_window_right" {})
   :pattern [ "*.txt" ]
   :callback
     (fn []
       (if (= vim.o.filetype :help)
           (vim.cmd.wincmd "L")))})

;; Import plugins
(require :config.plugins)

