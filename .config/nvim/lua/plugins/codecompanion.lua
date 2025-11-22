return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          --adapter = "ollama",
        },
        inline = {
          --adapter = "ollama",
        },
      },
      adapters = { http = {
        opts = {
          --allow_insecure = true,
          --proxy = "http://127.0.0.1:4141",
        },
        copilot = require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            }
          }
        }),
        ollama = require("codecompanion.adapters").extend("ollama", {
          schema = {
            num_ctx = {
              default = 2048 * 8,
            },
          },
          env = {
            url = "https://www.ohefnawi.net/muhLLM",
            api_key = os.getenv("OMAR_LLM_API_KEY"),
            model = "deepseek-r1:32b",
          },
          headers = {
            ["Authorization"] = "Bearer ${api_key}",
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
          },
        }),
      } }  ,
    })
  end,
}

