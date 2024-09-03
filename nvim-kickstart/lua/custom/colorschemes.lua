return {
  { 'shaunsingh/nord.nvim' },
  { 'bluz71/vim-nightfly-colors', name = 'nightlfy' },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
      }
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      }
    end,
  }
}
