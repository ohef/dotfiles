return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  config = function()
    require("codecompanion").setup({
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "https://desktop.local.ohefnawi.net:11434",
              api_key = "OLLAMA_API_KEY",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    })
  end,
}
