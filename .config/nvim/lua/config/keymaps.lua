local keymap = vim.keymap

-- Exist terminal mode in the builtin terminal with a shourcut that is a bit easier
-- for people to discovery. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what some will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Terminal: Leave mode" })

-- keybinds to make split navigation easier,
-- Use CTRL+<hjkl> to switch between windows
--
-- See `:help wincmd` for a list of all windows commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window: Focus left" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window: Focus upper" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window: Focus lower" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window: Focus right" })

-- Write current buffer to disk using a quick shortcut
keymap.set("n", "<C-s>", "<cmd>write<cr>", { desc = "Save file" })
keymap.set("n", "<C-w>", "<cmd>quitall!<cr>", { desc = "Close editor" })

-- Clear hightlights on search when pressing <Esc> in normal code
-- See :help hlsearch
keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search hightlights" })

-- Modify numbers under the cursor using simple keybindings
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Remove the previous word without manually moving the cursor
-- See `:help vb`
keymap.set("n", "dw", "vb_d", { desc = "Remove previous word" })

-- Select the entire buffer content quickly
-- See `:help gg` and `:help visual-mode`
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all content" })

-- Split the current window to view multiple buffer at the same tiem
-- See `:help split` and `:help vsplit`
keymap.set("n", "ss", "<cmd>split<cr>", { desc = "Window: Split horizontally" })
keymap.set("n", "sv", "<cmd>vsplit<cr>", { desc = "Window: Split vertically" })

-- Resize split windows directly from the keyboard
-- Use CTRL+<ArrowKeys> to adjust width and height of the actice window
--
-- See `:help window-resize`
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Window: Make narrower" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Windowa: Make wiber" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Window: Increase height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Window: Decrease height" })

-- Work with multiple tab pages when editing different files or layouts.
-- Tabs allow keeping separate window arrangements without replacing
-- the current workspace, which is useful when switching between tasks
-- or grouping related buffers.
--
-- See `:help tabpage`
keymap.set("n", "tn", "<cmd>tabnew<cr>", { desc = "Tab: Open new" })
keymap.set("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Tab: Go next" })
keymap.set("n", "<s-tab>", "<cmd>tabprev<cr>", { desc = "Tab: Go previous" })
keymap.set("n", "tc", "<cmd>tabclose<cr>", { desc = "Tab: Close current" })
keymap.set("n", "to", "<cmd>tabonly<cr>", { desc = "Tab: Keep only this" })

-- Reorder and move tabs when organizing multiple workspace
-- See `:help tabmove`
keymap.set("n", "tm>", "<cmd>tabmove +1<cr>", { desc = "Tab: Move right" })
keymap.set("n", "tm<", "<cmd>tabmove -1<cr>", { desc = "Tab: Move left" })

-- Jump direcly to specific tab position
-- Useful when working with a fixed number of tabs
--
-- See `:help :gt`
keymap.set("n", "t1", "1gt", { desc = "Tab: Switch to 1" })
keymap.set("n", "t2", "2gt", { desc = "Tab: Switch to 2" })
keymap.set("n", "t3", "3gt", { desc = "Tab: Switch to 3" })
keymap.set("n", "t4", "4gt", { desc = "Tab: Switch to 4" })
keymap.set("n", "t5", "5gt", { desc = "Tab: Switch to 5" })
keymap.set("n", "t6", "6gt", { desc = "Tab: Switch to 6" })
keymap.set("n", "t7", "7gt", { desc = "Tab: Switch to 7" })
keymap.set("n", "t8", "8gt", { desc = "Tab: Switch to 8" })
keymap.set("n", "t9", "9gt", { desc = "Tab: Switch to 9" })

-- Restore closed tab when reopening previous workspace
-- This helps recovering from accidental tab closures
--
-- See `:help tabpage`
keymap.set("n", "tu", "<cmd>tabundo<cr>", { desc = "Tab: Restore last closed" })

-- Rename the current file directly form the editor without leaving Neovim
-- This helps reorganizing files during refactoring without opening a terminal
--
-- See `:help t:`
-- keymap.set("n", "fr", require("utils.file").rename_current, { desc = "Rename current file" })

-- Move lines up and down while editing.
-- This helps reorganizing code without cutting and pasting.
--
-- See `:help :move`
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Edit: Move line up" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Edit: Move selection up" })

keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Edit: Move line down" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Edit: Move selection down" })

-- Adjust indentation levels while editing blocks fo code
-- Use <Option> + <hl> Shift indentation left or right
--
-- See `:help <<` and `:help >>`
keymap.set("n", "<A-h>", "<<", { desc = "Edit: Shift left" })
keymap.set("v", "<A-h>", "<gv", { desc = "Edit: Shift selection left" })

keymap.set("n", "<A-l>", ">>", { desc = "Edit: Shift right" })
keymap.set("v", "<A-l>", ">gv", { desc = "Edit: Shift selection right" })

-- Configuration keymaps for plugins
-- Comment line and block
keymap.set("n", "<C-/>", "gcc", { desc = "Toggle line comment", remap = true })
keymap.set("v", "<C-/>", "gc", { desc = "Toggle selection comment", remap = true })
