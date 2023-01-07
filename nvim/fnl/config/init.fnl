(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; Generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")

(def- cmd vim.api.nvim_command)
(def- nset nvim.ex.set)
(def- keymap nvim.set_keymap)

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

;; Mappings
(keymap :n :<leader>ev ":vsp ~/.dotfiles/nvim/fnl/config/init.fnl<CR>" {:noremap true})
(keymap :n :<c-d> "yyp" {:noremap true})
(keymap :i :<c-d> "<esc>yypi" {:noremap true})
(keymap :n :<c-k> "<esc>^hvk$d" {:noremap true})
(keymap :i :<c-k> "<esc>^hvk$di" {:noremap true})
(keymap :n :<c-c> "<esc>vk$c" {:noremap true})
(keymap :n :<c-del> "<esc>VG$dzb" {:noremap true})

(keymap :n :<leader>ch ":checkhealth<CR>" {:noremap true})
(keymap :n :<leader>an ":e ~/docs/notes/" {:noremap true})

;; Packer
(keymap :n :<leader>pu ":PackerUpdate<CR>" {:noremap true})
(keymap :n :<leader>pi ":PackerInstall<CR>" {:noremap true})
(keymap :n :<leader>pc ":PackerClean<CR>" {:noremap true})

;; Import plugin.fnl
(require :config.plugin)

