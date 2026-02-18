-- Turm on/off colorscheme transparency
-- Usage:
--   :ToggleTransparency

local M = {}

-- Store original highlight settings
local original_highlights = {}
local transparent = false

-- Highlight groups commonly responsible for backgrounds
local highlight_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "EndOfBuffer",
  "MsgArea",
  "FloatBorder",
  "NormalFloat",
  "StatusLine",
  "StatusLineNC",
  "VertSplit",
  "LineNr",
  "CursorLineNr",
  "Folded",
  "WinSeparator",
  "Pmenu",
  "PmenuSel",
  "TabLine",
  "TabLineFill",
  "TabLineSel",
}

-- Save current highlights
local function save_highlights()
  for _, group in ipairs(highlight_groups) do
    if not original_highlights[group] then
      original_highlights[group] = vim.api.nvim_get_hl(0, { name = group })
    end
  end
end

-- Apply transparency
local function enable_transparency()
  save_highlights()
  for _, group in ipairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
  transparent = true
end

-- Restore original backgrounds
local function disable_transparency()
  for group, opts in pairs(original_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
  transparent = false
end

-- Toggle function
function M.toggle()
  if transparent then
    disable_transparency()
  else
    enable_transparency()
  end
end

-- Optional setup function
function M.setup()
  vim.api.nvim_create_user_command(
    "ToggleTransparency",
    function() M.toggle() end,
    {}
  )
end

return M
