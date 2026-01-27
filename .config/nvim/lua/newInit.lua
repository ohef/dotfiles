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

vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic under cursor" })

-- in your init.lua or lsp config
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '■', '▎', '→', etc.
    spacing = 2,  -- Space between code and message
    severity = vim.diagnostic.severity.ERROR, -- Only show errors inline, optional
  },
  signs = true,     -- gutter signs
  underline = true, -- underline errors
  update_in_insert = false, -- update diagnostics while typing
})
