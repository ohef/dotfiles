return {
  {
    'EvWilson/spelunk.nvim',
    dependencies = {
      'ibhagwan/fzf-lua',                -- Optional: for enhanced fuzzy search capabilities
    },
    config = function()
      require('spelunk').setup({
        enable_persist = true
      })
    end
  }
}
