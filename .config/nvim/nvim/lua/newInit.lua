require("config.lazy")

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set('n', '<A-,>', toggle_quickfix)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- Copy current file to clipboard
vim.keymap.set('n', '<leader>cy', 'let @*=@%')
