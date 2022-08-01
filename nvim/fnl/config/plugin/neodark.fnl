(module config.plugin.neodark
  {autoload {nvim aniseed.nvim
             neodark neodark}})

(neodark.setup
  {:theme_style :neodarker})

