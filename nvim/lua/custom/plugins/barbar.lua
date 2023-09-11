--[[
return {
  'romgrk/barbar.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = false,
    tabpages = true,
    auto_hide = true,
    insert_at_start = false,
    insert_at_end = true,
    minimum_padding = 1,
    sidebar_filetypes = {
      NvimTree = true,
      -- ['neo-tree'] = { event = 'BufWipeout' },
    },
    no_name_title = '???'
  }
}
]]
return {}
