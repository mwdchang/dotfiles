return {
  'folke/neoconf.nvim',
  config = function()
    require('neoconf').setup()
  end,
  name = "neoconf",
  lazy = false,
  priority = 1000
}
