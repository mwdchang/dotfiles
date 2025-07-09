local options = { noremap = true }

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", options)
vim.keymap.set("n", "<leader>s", ":w<CR>", options)
vim.keymap.set("n", "<leader>jq", ":%!jq .<CR>", options)
vim.keymap.set("n", "<leader>j", ":!python -m json.tool<CR>", options)

-- Buffer movement
vim.keymap.set("n", "<leader>a", "<Cmd>BufferPrevious<CR>", options)
vim.keymap.set("n", "<leader>s", "<Cmd>BufferNext<CR>", options)

-- Don't jump to the next match token
vim.keymap.set("n", "*", "*``", options)

-- Alternate <Escape>
vim.keymap.set("i", ";;", "<esc>", options)

-- Jump to last edit
vim.keymap.set("n", "<leader>h", "'.", options)

-- Close everything except the current buffer
vim.keymap.set("n", "<leader>c", "<Cmd>w | %bd | e#<CR>", options)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, options)

-- Copy buffer
vim.keymap.set("n", "<leader>y", 'gg"+yG', options)

-- Useful for copying UUID under cursor
vim.api.nvim_set_keymap(
	"n",
	"<leader>u",
	[[:silent execute "normal! viW" <Bar> "zy:<C-R>z<CR>"]],
	{ noremap = true, silent = true }
)

-- vim.keymap.set("n", "<leader>W", function()
-- 	local char_count = #table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, true), "\n")
-- 	vim.notify("Char count: " .. char_count)
-- end, { desc = "Show buffer character count" })

vim.keymap.set("n", "<leader>W", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)

	local char_count = #table.concat(lines, "\n")
	local line_count = #lines

	local text = table.concat(lines, "\n")
	local word_count = 0
	for _ in string.gmatch(text, "%S+") do
		word_count = word_count + 1
	end

	local content = {
		"\tChars: " .. char_count,
		"\tWords: " .. word_count,
		"\tLines: " .. line_count,
	}

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

	local width = 30
	for _, line in ipairs(content) do
		width = math.max(width, #line + 4)
	end

	local height = #content
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	vim.defer_fn(function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end, 3000)
end, { desc = "Show buffer char, line, and word count in float" })

-- hashbang
vim.cmd([[iab #! #!/usr/bin/env bash]])
