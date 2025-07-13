local M = {}

function M.word_count()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)

  local char_count = #table.concat(lines, '\n')
  local line_count = #lines

  local text = table.concat(lines, '\n')
  local word_count = 0
  for _ in string.gmatch(text, '%S+') do
    word_count = word_count + 1
  end

  local content = {
    '\tChars: ' .. char_count,
    '\tWords: ' .. word_count,
    '\tLines: ' .. line_count,
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local width = 30
  for _, line in ipairs(content) do
    width = math.max(width, #line + 4)
  end

  local height = #content
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 3000)
end

return M
