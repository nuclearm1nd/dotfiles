-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local cmp_src_menu_items = {buffer = "buff", conjure = "conj", nvim_lsp = "lsp", luasnip = "lsnp"}
local cmp_srcs = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "buffer"}, {name = "luasnip"}}
local function has_words_before()
  unpack = (unpack or table.unpack)
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local function _1_()
    local _2_ = vim.api.nvim_buf_get_lines(0, (line - 1), line, true)
    if (nil ~= _2_) then
      local _3_
      do
        local t_4_ = _2_
        if (nil ~= t_4_) then
          t_4_ = (t_4_)[1]
        else
        end
        _3_ = t_4_
      end
      if (nil ~= _3_) then
        local _6_ = _3_:sub(col, col)
        if (nil ~= _6_) then
          local _7_ = _6_:match("%s")
          if (nil ~= _7_) then
            return (_7_ == nil)
          else
            return _7_
          end
        else
          return _6_
        end
      else
        return _3_
      end
    else
      return _2_
    end
  end
  return ((col ~= 0) and _1_())
end
local function _12_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local function _13_(entry, item)
    item.menu = (cmp_src_menu_items[entry.source.name] or "")
    return item
  end
  local function _14_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif has_words_before() then
      return cmp.complete()
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _16_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _18_(args)
    return luasnip.lsp_expand(args.body)
  end
  cmp.setup({formatting = {format = _13_}, mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = false}), ["<Tab>"] = cmp.mapping(_14_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_16_, {"i", "s"}), ["<C-Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), ["<C-Down>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"})}, snippet = {expand = _18_}, sources = cmp_srcs})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
end
return {{"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-vsnip", "PaterJason/cmp-conjure", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}, config = _12_}}
