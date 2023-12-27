local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Search word
keymap.set('n', '*', '*``<C-o>')

-- Search and remplace
keymap.set('n', '<Space>s', ':%s///g<Left><Left>', { silent = true })

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
keymap.set('n', '<C-t>', ':tabedit<CR>', { silent = true })

-- Move tab
keymap.set('n', '<Tab>', ':tabnext<CR>', { silent = true })
keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { silent = true })
keymap.set('n', 'to', ':tabonly<CR>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', 'ml', '<C-w><')
keymap.set('n', 'mh', '<C-w>>')
keymap.set('n', 'mk', '<C-w>+')
keymap.set('n', 'mj', '<C-w>-')

-- NERDtree
keymap.set('n', '<C-f>', ':NERDTreeToggle<CR>', { silent = true })

-- Commentary
keymap.set('n', '<Space>/', ':Commentary<CR>', { silent = true })
keymap.set('v', '<Space>/', ':Commentary<CR>', { silent = true })
