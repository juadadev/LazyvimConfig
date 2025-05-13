-- add any tools you want to have installed below
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "pyright", -- type checker python
        "ruff-lsp", -- LSP for ruff python
        "ruff", -- formatter + linter python
      },
    },
  },
}
