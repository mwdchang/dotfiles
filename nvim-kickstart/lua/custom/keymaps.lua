local options = { noremap = true }

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', options)
vim.keymap.set('n', '<leader>s', ':w<CR>', options)
vim.keymap.set('n', '<leader>jq', ':%!jq .<CR>', options)
vim.keymap.set('n', '<leader>j', ':!python -m json.tool<CR>', options)

-- Buffer movement
vim.keymap.set('n', '<leader>a', '<Cmd>BufferPrevious<CR>', options)
vim.keymap.set('n', '<leader>s', '<Cmd>BufferNext<CR>', options)

-- Don't jump to the next match token
vim.keymap.set('n', '*', '*``', options)

-- Alternate <Escape>
vim.keymap.set('i', ';;', '<esc>', options)

-- Jump to last edit
vim.keymap.set('n', '<leader>h', "'.", options)

-- Close everything except the current buffer
vim.keymap.set('n', '<leader>c', '<Cmd>w | %bd | e#<CR>', options)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, options)

-- Copy buffer
vim.keymap.set('n', '<leader>y', 'gg"+yG', options)

-- Useful for copying UUID under cursor
vim.api.nvim_set_keymap('n', '<leader>u', [[:silent execute "normal! viW" <Bar> "zy:<C-R>z<CR>"]], { noremap = true, silent = true })


-- hashbang
vim.cmd([[iab #! #!/usr/bin/env bash]])

