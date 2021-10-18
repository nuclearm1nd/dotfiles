(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; Generic mapping leaders configuration
;(nvim.set_keymap :n :<space> :<nop> {:noremap true})
;(set nvim.g.mapleader " ")

(def- cmd vim.api.nvim_command)
(def- nset nvim.ex.set)

(set nvim.g.maplocalleader ",")

;; Allow hidden buffers
(nset :hidden)

;; Show line numbers
(nset :number)

;; Open new splits right and at bottom
(nset :splitright)
(nset :splitbelow)

;; Expand TABs to spaces
(nset :expandtab)

;; Don't wrap lines
(nset :nowrap)

;; Mouse support
(nset :ttyfast)

;; Sets nvim global options
(let [options
      {;; Settings needed for compe autocompletion
       :completeopt "menuone,noselect"

       ;; Shared clipboard with linux
       ;:clipboard "unnamedplus"

       ;; Mouse support
       :mouse "a"

       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
      }]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

;; Plugins which are assumed to be installed globally
;; vim-airline
;; vim-airline-themes
;; vim-colorsamplerpack
;; vim-ctrlp
;; vim-fugitive
;; vim-nerdtrtee

;; Airline config
(cmd "let g:airline_theme='minimalist'")
(cmd "let g:airline#extensions#tabline#enabled = 1")
(cmd "let g:airline#extensions#whitespace#checks = ['indent', 'trailing']")

;; CtrlP: Ignore files ignored by git
(cmd "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']")

;; Import plugin.fnl
(require :config.plugin)

