-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    -- Import your plugins
    { import = "plugins" },
    -- Plugin conversions
    { "scrooloose/nerdcommenter" },
    { "scrooloose/nerdtree" },
    { "bling/vim-airline" },
    { "altercation/vim-colors-solarized" },
    -- Uncomment if needed
    -- { "dhruvasagar/vim-table-mode" },
    { "easymotion/vim-easymotion" },
    { "tpope/vim-surround" },
    -- Uncomment if needed
    -- { "hrj/vim-DrawIt" },
    {
      "Shougo/vimproc.vim",
      build = function()
        if vim.fn.has("win32") == 1 then
          vim.fn["system"]("tools\\update-dll-mingw")
        end
      end,
    },
    { "dracula/vim", name = "dracula" },
    { "SirVer/ultisnips" },
    { "honza/vim-snippets" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-abolish" },
    { "metakirby5/codi.vim" },
    { "neoclide/coc.nvim", branch = "release" },
    { "vim-scripts/ReplaceWithRegister" },
    { "LunarWatcher/auto-pairs", branch = "develop" },
    { "vim-airline/vim-airline-themes" },
    { "junegunn/fzf", build = "./install --all"},
    { "junegunn/fzf.vim" },
    { "junegunn/vim-easy-align" },
    { "chrisbra/Colorizer" },
    { "drn/zoomwin-vim" },
    { "AndrewRadev/splitjoin.vim" },
    { "ohef/vim-jsonpath" },
    { "preservim/vim-markdown" },
    { "bkad/CamelCaseMotion" },
    { "github/copilot.vim" },
    { "jpalardy/vim-slime" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- Automatically check for plugin updates
  checker = { enabled = true },
})
