-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local _let_3_ = autoload("config.util")
  local keymap = _let_3_["keymap"]
  keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
  keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
  keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
  keymap("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
  keymap("n", "<leader>fc", ":lua require('telescope.builtin').git_commits()<CR>")
  return keymap("n", "<leader>fx", ":lua require('telescope.builtin').git_bcommits()<CR>")
end
local function _4_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, init = _2_, config = _4_}}
