return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      --[[ things you want to change go here]]
      -- Key to open/close terminal
      open_mapping = [[<c-t>]],

      -- Enable mapping in mode insert
      inset_mappings = true,

      -- Enable mapping in mode terminal
      terminal_mappings = true,
    },
    -- Make sure the "hidden" option is enabled
    init = function()
      vim.o.hidden = true
    end,
  },
}
