-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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
    --{ "bling/vim-airline" },
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
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup {
          highlight = {
            enable = true,
            disable = { "lua" }
          },
          ensure_installed = {
            "vimdoc",
            "luadoc",
            "vim",
            "lua",
            "markdown",
            "typescript", "javascript", 'json', 'jsonc', 'yaml', 'html', 'css', 'scss', 'graphql', 'tsx'
          }
        }
      end,
    },
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        'nvim-neotest/neotest-jest'
      },
      config = function()
        require('neotest').setup({
          adapters = {
            require('neotest-jest')({
              jestCommand = "npm run testOld --",
              jestConfigFile = "legacy.jest.config.ts",
              env = { CI = true },
              cwd = function(path)
                return vim.fn.getcwd()
              end,
            }),
          },
          output = {
            use_float = false, -- Set this to false to disable floating windows
          },
        })
      end
    },
    { "dracula/vim",                    name = "dracula" },
    { "tpope/vim-tbone" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-abolish" },
    { "tpope/vim-rhubarb" },
    { "vim-scripts/ReplaceWithRegister" },
    --{ "LunarWatcher/auto-pairs",        branch = "develop" },
    { "junegunn/fzf",                   build = "./install --all" },
    { "junegunn/fzf.vim" },
    { "junegunn/vim-easy-align" },
    { "chrisbra/Colorizer" },
    {
      'pwntester/octo.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      config       = function()
        require("octo").setup()
      end
    },
    { "bkad/CamelCaseMotion" },
    { "github/copilot.vim" },
    { "jpalardy/vim-slime" },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config('ts_ls', {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          }
        })

        vim.lsp.enable('bashls')
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('pyright')
      end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- Automatically check for plugin updates
  checker = { enabled = true },
})
