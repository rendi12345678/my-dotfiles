vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Move cursor left
keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true, desc = 'Move cursor left' })

-- Move cursor right
keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true, desc = 'Move cursor right' })

-- Delete the character before the cursor
keymap.set('i', '<C-d>', '<Delete>', { noremap = true, silent = true, desc = 'Delete the character before the cursor' })

-- Delete the word before the cursor (Ctrl+w in Vim)
keymap.set('i', '<C-w>', '<C-o>db<C-o>x', { noremap = true, silent = true, desc = 'Delete the word before the cursor' })

-- Delete the word after the cursor (Alt+d in Vim)
keymap.set('i', '<C-D>', '<C-o>dw', { noremap = true, silent = true, desc = 'Delete the word after the cursor' })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit inset mode" })

-- Select all
keymap.set("n", "<C-t>", "gg<S-v>G")

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

vim.keymap.set("n", "<leader>ld", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- open Lazy nvim
keymap.set("n", "<leader>ll", ":Lazy<CR>", { desc = "Open Lazy nvim" }) 

-- Jump to local mark
keymap.set('n', '<leader>ja', "'a", { noremap = true, silent = true, desc = "Jump to Line of Mark 'a'" })

-- Jump to global mark
keymap.set('n', '<leader>jA', "'A", { noremap = true, silent = true, desc = "Jump to Line of Global Mark 'A'" })

-- Delete mark 'a'
keymap.set('n', '<leader>dm', ':delmarks a<CR>', { noremap = true, silent = true, desc = "Delete Mark 'a'" })

-- Delete mark 'A'
keymap.set('n', '<leader>dm', ':delmarks A<CR>', { noremap = true, silent = true, desc = "Delete Mark 'a'" })

-- List all marks
keymap.set('n', '<leader>lm', ':marks<CR>', { noremap = true, silent = true, desc = "List All Marks" })

-- Toggle Zen Mode 
keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Toggle Zen Mode" }) 

-- Set wrap and nowrap
keymap.set("n", "[w", ":set wrap<cr>", { desc = "Set wrap" })
keymap.set("n", "]w", ":set nowrap<cr>", { desc = "Set nowrap" })

-- switch window
keymap.set("n", "<leader>sw", "<C-w>w", { desc = "Decrement number" }) -- decrement

-- window managemenEsct
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
