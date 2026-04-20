local keymap = vim.keymap

-- Clear hightlights on search when pressing <Esc> in normal code
-- See :help hlsearch
keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Exist terminal mode in the builtin terminal with a shourcut that is a bit easier
-- for people to discovery. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what some will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- keybinds to make split navigation easier,
-- Use CTRL+<hjkl> to switch between windows
--
-- See `:help wincmd` for a list of all windows commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "move focus to the upper window" })

-- Write current buffer to disk using a quick shortcut
keymap.set("n", "<C-s>", "<cmd>write<cr>", { desc = "Save current file" })

-- Modify numbers under the cursor using simple keybindings
keymap.set("n", "+", "<C-a>", { desc = "Increment number under cursor" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

-- Remove the previous word without manually moving the cursor
-- See `:help vb`
keymap.set("n", "dw", "vb_d", { desc = "Delete previous word backwards" })

-- Select the entire buffer content quickly
-- See `:help gg` and `:help visual-mode`
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all content in buffer" })

-- Move forward in the jumplist history
-- See `:help jumplist`
keymap.set("n", "<C-m>", "<C-i>", { desc = "Jump forward in jumplist" })

-- Split the current window to view multiple buffer at the same tiem
-- See `:help split` and `:help vsplit`
keymap.set("n", "ss", "<cmd>split<cr>", { desc = "Split window horizontally" })
keymap.set("n", "sv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })

-- Resize split windows directly from the keyboard
-- Use CTRL+<ArrowKeys> to adjust width and height of the actice window
--
-- See `:help window-resize`
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Resize window left" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Resize window right" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Increase window height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Decrease window height" })

-- Work with multiple tab pages when editing different files or layouts.
-- Tabs allow keeping separate window arrangements without replacing
-- the current workspace, which is useful when switching between tasks
-- or grouping related buffers.
--
-- See `:help tabpage`
keymap.set("n", "te", "<cmd>tabedit<cr>", { desc = "Open new tab with current buffer" })
keymap.set("n", "tn", "<cmd>tabnew<cr>", { desc = "Open new empty tab" })
keymap.set("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
keymap.set("n", "<s-tab>", "<cmd>tabprev<cr>", { desc = "Go to previous tab" })
keymap.set("n", "tc", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap.set("n", "to", "<cmd>tabonly<cr>", { desc = "Close all tabs except current" })

-- Reorder and move tabs when organizing multiple workspace
-- See `:help tabmove`
keymap.set("n", "tm>", "<cmd>tabmove +1<cr>", { desc = "Move tab to the right" })
keymap.set("n", "tm<", "<cmd>tabmove -1<cr>", { desc = "Move tab to the left" })

-- Jump direcly to specific tab position
-- Useful when working with a fixed number of tabs
--
-- See `:help :gt`
keymap.set("n", "t1", "1gt", { desc = "Go to tab 1" })
keymap.set("n", "t2", "2gt", { desc = "Go to tab 2" })
keymap.set("n", "t3", "3gt", { desc = "Go to tab 3" })
keymap.set("n", "t4", "4gt", { desc = "Go to tab 4" })
keymap.set("n", "t5", "5gt", { desc = "Go to tab 5" })
keymap.set("n", "t6", "6gt", { desc = "Go to tab 6" })
keymap.set("n", "t7", "7gt", { desc = "Go to tab 7" })
keymap.set("n", "t8", "8gt", { desc = "Go to tab 8" })
keymap.set("n", "t9", "9gt", { desc = "Go to tab 9" })

-- Restore closed tab when reopening previous workspace
-- This helps recovering from accidental tab closures
--
-- See `:help tabpage`
keymap.set("n", "tu", "<cmd>tabundo<cr>", { desc = "Reopen last closed tab" })

-- Rename the current file directly form the editor without leaving Neovim
-- This helps reorganizing files during refactoring without opening a terminal
--
-- See `:help t:`
-- keymap.set("n", "fr", require("utils.file").rename_current, { desc = "Rename current file" })

-- Move lines up and down while editing.
-- This helps reorganizing code without cutting and pasting.
--
-- See `:help :move`
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Adjust indentation levels while editing blocks fo code
-- Use <Option> + <hl> Shift indentation left or right
--
-- See `:help <<` and `:help >>`
keymap.set("n", "<A-l>", ">>", { desc = "Indent line right" })
keymap.set("n", "<A-h>", "<<", { desc = "Indent line left" })

keymap.set("v", "<A-h>", "<gv", { desc = "Indent selection left" })
keymap.set("v", "<A-l>", ">gv", { desc = "Indent selection right" })

-- Configuration keymaps for plugins
-- Execute the current file as a test unsing Plenary
-- '%' expands to the current buffer path.
keymap.set("n", ",t", function()
  require("lazy").load({ plugins = { "plenary.nvim" } })
  vim.cmd("PlenaryBustedFile %")
end, { desc = "Run current test file" })

-- Comment line and block
keymap.set("n", "<C-/>", "gcc", { desc = "Comment current line", remap = true })
keymap.set("v", "<C-/>", "gc", { desc = "Comment current block", remap = true })
