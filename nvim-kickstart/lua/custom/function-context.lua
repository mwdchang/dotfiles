-- gutter line number highlight --
vim.api.nvim_set_hl(0, 'FunctionLineNumber', { fg = '#aaeeee', bg = '#888888' }) -- Orange
local ns = vim.api.nvim_create_namespace 'FunctionLineHighlight'

local ts_utils = require 'nvim-treesitter.ts_utils'

local function highlight_function_lines()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) -- clear previous

  local node = ts_utils.get_node_at_cursor()
  while node do
    if node:type() == 'function_definition' or node:type() == 'function_declaration' then
      local start_row, _, end_row, _ = node:range()
      for lnum = start_row, end_row do
        vim.api.nvim_buf_set_extmark(0, ns, lnum, 0, {
          sign_text = '',
          number_hl_group = 'FunctionLineNumber',
        })
      end
      break
    end
    node = node:parent()
  end
end

-- Call the function when cursor moves
local M = {}
local fn_context_enabled = false
function M.toggle_fn_context()
  if fn_context_enabled then
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) -- clear previous
    vim.api.nvim_clear_autocmds { group = 'FnContext' }
  else
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = vim.api.nvim_create_augroup('FnContext', { clear = true }),
      callback = highlight_function_lines,
    })
  end
  fn_context_enabled = not fn_context_enabled
end

return M
