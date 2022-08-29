local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Save and exit form neovim
keymap.set('n', '<C-s>', ':write<CR>', { silent = true })
keymap.set('n', '<C-q>', ':quitall<CR>', { silent = true })

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<CR>', { silent = true })

-- Move tab
keymap.set('n', '<Tab>', ':tabnext<CR>', { silent = true })
keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { silent = true })
keymap.set('n', 'to', ':tabonly<CR>', { silent = true })
keymap.set('n', 'tc', ':tabclose<CR>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
