--[[
return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',
    -- keys = {
    --   {
    --     "<leader>cc",
    --     function()
    --       require("CopilotChat").toggle()
    --     end,
    --     desc = "Toggle Copilot Chat",
    --   },
    -- },
    opts = {
      -- See Configuration section for options
    },
    -- enabled = false,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
]]--


return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
}
