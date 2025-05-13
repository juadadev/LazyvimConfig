-- Here you can configure formatters with conform
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff" },
    },
  },
}
