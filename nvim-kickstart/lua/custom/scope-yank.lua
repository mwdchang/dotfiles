local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")

--[[
Yanks content from specific scopes for blocks, based on treesitter
--]]
function M.scope_yank()
  local bufnr = vim.api.nvim_get_current_buf()
  local node = ts_utils.get_node_at_cursor()

  -- Expanded list of scope-defining nodes across multiple languages
  local valid_nodes = {
    function_definition = true,
    function_declaration = true,
    ["function"] = true,
    method_definition = true,
    class_definition = true,
    arrow_function = true,
    function_expression = true,
    lambda = true,
    lambda_expression = true,
    lexical_declaration = true,
    variable_declaration = true,
    assignment_expression = true,
    if_statement = true,
    if_expression = true,
    while_statement = true,
    for_statement = true,
    switch_statement = true,
    do_statement = true,
    try_statement = true,
    catch_clause = true,
    block = true,
    table_constructor = true,
    object = true,
    pair = true,
  }

  -- Traverse UP and stop at first matching node (innermost scope)
  while node do
    local node_type = node:type()
    if valid_nodes[node_type] then
      -- Optimization: If we hit an arrow function or expression, 
      -- check if it's part of a variable declaration/assignment
      -- and yank that instead for a more complete "scope".
      local parent = node:parent()
      if parent and (node_type == "arrow_function" or node_type == "function_expression") then
        if parent:type() == "variable_declarator" or parent:type() == "assignment_expression" then
          node = parent:parent() or parent
        end
      end

      local start_row, _, end_row, _ = node:range()
      
      -- Programmatic yank to avoid clobbering marks or visual state
      local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
      local content = table.concat(lines, "\n") .. "\n"
      
      -- Yank to the unnamed register (respecting "unnamedplus" if set)
      vim.fn.setreg(vim.v.register, content, "V")

      -- Visual feedback: Flash the yanked range
      local ns = vim.api.nvim_create_namespace("scope_yank_flash")
      vim.hl.range(bufnr, ns, "IncSearch", { start_row, 0 }, { end_row, 9999 }, {
        priority = 100,
      })
      
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(bufnr) then
          vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
        end
      end, 200)

      return
    end
    node = node:parent()
  end

  vim.notify("No enclosing scope found.", vim.log.levels.WARN)
end

return M
