-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local util = autoload("config.util")
util.keymap("n", "<leader>lI", ":LspInfo<CR>")
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function _2_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local before_init
  local function _3_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _3_
  local on_attach
  local function _4_(client, bufnr)
    local keymap
    local function _5_(mode, from, to, _3fopts)
      return nvim.buf_set_keymap(bufnr, mode, from, to, util.merge({noremap = true}, _3fopts))
    end
    keymap = _5_
    keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
    keymap("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>")
    keymap("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>")
    keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>")
    keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
    keymap("n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<CR>")
    keymap("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<CR>")
    return keymap("n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<CR>")
  end
  on_attach = _4_
  local lua_settings = {Lua = {runtime = {version = "LuaJIT"}, diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false}, telemetry = {enable = false}}}
  lsp.clojure_lsp.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
  lsp.lua_ls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities, settings = lua_settings})
  return lsp.fennel_ls.setup({})
end
return {{"neovim/nvim-lspconfig", config = _2_}}
