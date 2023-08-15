-- Unless you are still migrating, remove the deprecated commands from v1.x
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--[[
return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {
      close_if_last_window = true,
      enable_git_status = false,
      default_component_configs = {
      },
      window = {
        width = 30,
        mappings = {
          ["o"] = { "toggle_node" },
          ["P"] = function(state)
            local node = state.tree:get_node()
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        }
      }
    }
  end,
}
]]

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      git = {
        enable = false
      }
    })
  end
}
