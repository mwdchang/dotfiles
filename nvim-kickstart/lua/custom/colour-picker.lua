local M = {}

local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local original_colorscheme = vim.g.colors_name

function M.pick_colorscheme()
  local themes = vim.fn.getcompletion("", "color")

  pickers.new({
    layout_config = {
      width = 0.4,
      height = 0.5,
    },
    border = true,
  }, {
    prompt_title = "Colorscheme Picker",
    finder = finders.new_table {
      results = themes,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local previewed = original_colorscheme

      local function preview_colorscheme(scheme)
        if scheme and scheme ~= previewed then
          local ok, _ = pcall(vim.cmd, "colorscheme " .. scheme)
          if ok then
            previewed = scheme
          end
        end
      end

      -- Preview as you move
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd("colorscheme " .. selection[1])
      end)

      -- Escape to revert
      map({ "i", "n" }, "<Esc>", function()
        actions.close(prompt_bufnr)
        vim.cmd("colorscheme " .. original_colorscheme)
      end)

      -- Live preview on move
      map("i", "<Down>", function()
        actions.move_selection_next(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        preview_colorscheme(selection[1])
      end)

      map("i", "<Up>", function()
        actions.move_selection_previous(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        preview_colorscheme(selection[1])
      end)

      map("n", "j", function()
        actions.move_selection_next(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        preview_colorscheme(selection[1])
      end)

      map("n", "k", function()
        actions.move_selection_previous(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        preview_colorscheme(selection[1])
      end)

      return true
    end,
  }):find()
end

return M

