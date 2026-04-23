return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      env = {
        url = "https://10.64.22.60:11434",
      },
      strategies = {
        chat = { 
          adapter = 'ollama', 
          model = { 'qwen2.5-coder:7b' },
        },
        actions = { 
          adapter = 'ollama',
          model = { 'qwen2.5-coder:7b' },
        },
        inline = { 
          adapter = 'ollama',
          model = { 'qwen2.5-coder:7b' },
        },
      },
      adapters = {
        http = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              -- Model not really used, overridden by strategies
              model = { 'mistral:latest' },
              env = {
                url = "http://10.64.22.60:11434",
                api_key = "NONE"
              },
              headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer ${api_key}",
              },
              parameters = {
                  sync = true,
              },
            })
          end
        }
      }
    }
  end,
}

-- return {
--   "olimorris/codecompanion.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
--   opts = {
--     strategies = {
--       chat = {
--         adapter = "ollama", model = "mistral",
--       },
--       inline = {
--         adapter = "ollama", model = "mistral",
--       },
--       cmd = {
--         adapter = "ollama", model = "mistral",
--       },
--       agent = { 
--         adapter = "ollama",  model = "mistral"
--       },
--       -- Change the default chat adapter and model
--       -- chat = {
--       --   adapter = "anthropic",
--       --   model = "claude-sonnet-4-20250514"
--       -- },
--     },
--     -- NOTE: The log_level is in `opts.opts`
--     opts = {
--       log_level = "DEBUG",
--     },
--   },
-- }
