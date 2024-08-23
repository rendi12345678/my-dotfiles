-- Disable backup files as some servers have issues with them
vim.opt.backup = false
vim.opt.writebackup = false

-- Reduce updatetime for better user experience
vim.opt.updatetime = 300

-- Always show the signcolumn to avoid text shifting
vim.opt.signcolumn = "yes"

-- Key mapping utility
local keyset = vim.keymap.set

-- Function to check if there is a backspace
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use <Tab> and <Shift-Tab> for navigation in completion menu
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
keyset("i", "<C-k>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', opts)

-- Use <Tab> to confirm completion
keyset("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <C-space> to trigger completion
keyset("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

-- Diagnostic navigation mappings
keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation mappings
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Visual mode mapping for <leader>f to format selected text
keyset('v', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })

-- Function to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.fn.eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Symbol renaming mapping
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Code action mappings
local codeaction_opts = { silent = true, nowait = true }
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", codeaction_opts)
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", codeaction_opts)
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", codeaction_opts)

-- Code Lens action mapping
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", codeaction_opts)

-- Scroll float windows/popups with <C-f> and <C-b>
local float_scroll_opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', float_scroll_opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', float_scroll_opts)
keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(1)<CR>" : "<Right>"', float_scroll_opts)
keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(0)<CR>" : "<Left>"', float_scroll_opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', float_scroll_opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', float_scroll_opts)

-- Add :Format command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Add :Fold command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add :OR command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Mappings for CoCList
local list_opts = { silent = true, nowait = true }
keyset("n", "<space>al", ":<C-u>CocList diagnostics<CR>", list_opts)
keyset("n", "<space>el", ":<C-u>CocList extensions<CR>", list_opts)
keyset("n", "<space>cl", ":<C-u>CocList commands<CR>", list_opts)
keyset("n", "<space>ol", ":<C-u>CocList outline<CR>", list_opts)
keyset("n", "<space>sl", ":<C-u>CocList -I symbols<CR>", list_opts)
keyset("n", "<space>jl", ":<C-u>CocNext<CR>", list_opts)
keyset("n", "<space>kl", ":<C-u>CocPrev<CR>", list_opts)
keyset("n", "<space>pl", ":<C-u>CocListResume<CR>", list_opts)
