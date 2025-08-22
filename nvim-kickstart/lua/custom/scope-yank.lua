local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")


function M.scope_yank()
  local bufnr = vim.api.nvim_get_current_buf()
  local node = ts_utils.get_node_at_cursor()

  local valid_nodes = {
    function_definition = true,
    function_declaration = true,
    ['function'] = true,
    method_definition = true,
    if_statement = true,
    if_expression = true,
    while_statement = true,
    for_statement = true,
    switch_statement = true,
    do_statement = true,
    block = true,
  }

  local closest_scope = nil

  -- Traverse UP and stop at first matching node (innermost scope)
  while node do
    if valid_nodes[node:type()] then
      local start_row, _, end_row, _ = node:range()
      vim.api.nvim_buf_set_mark(bufnr, "<", start_row + 1, 0, {})
      vim.api.nvim_buf_set_mark(bufnr, ">", end_row + 1, 0, {})
      vim.cmd('normal! `<V`>y')  -- linewise yank
      return
    end
    node = node:parent()
  end

  print("No enclosing scope found.")
end

return M
