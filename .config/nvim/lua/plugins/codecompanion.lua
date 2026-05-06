return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      interactions = {
        chat = {
          adapter = {
            name = "opencode",
            model =  "gemma4-q8"
          },
        },
        inline = {
          adapter = {
            name = "openai",
            model = "gemma4-q8"
          },
        },
        agent = {
          adapter = {
            name = "opencode",
            model =  "gemma4-q8"
          },
        }
      },
      adapters = {
        http = {
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              url = "http://ai.ohefn.org:5002/v1/chat/completions"
            })
          end,
        },
        opts = {
          allow_insecure = true,
          --proxy = "http://127.0.0.1:4141",
        }
      },
    })
  end,
}
