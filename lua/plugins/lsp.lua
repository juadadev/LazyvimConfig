return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- PYRIGHT TO PYTHON
      opts.servers.pyright = {
        before_init = function(_, config)
          -- search for virtual environment in the project root directory
          local function get_python_path(workspace)
            local paths = { ".venv", "venv", "env" }
            for _, name in ipairs(paths) do
              local venv_python = vim.fs.joinpath(workspace, name, "bin", "python")
              if vim.uv.fs_stat(venv_python) then
                return venv_python
              end
            end
            return "python"
          end

          config.settings = config.settings or {}
          config.settings.python = config.settings.python or {}
          config.settings.python.pythonPath = get_python_path(vim.fn.getcwd())
        end,

        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              reportUnusedVariable = "warning",
              typeCheckingMode = "basic",

              linting = {
                enabled = false, -- Desactiva todos los linters
                pyflakesEnabled = false, -- Desactiva pyflakes
                pycodestyleEnabled = false, -- Desactiva pycodestyle
                pylintEnabled = false, -- Si usas pylint, desactívalo
                autopep8Enabled = false, -- Desactiva autopep8
              },
            },
          },
        },
      }

      -- BASHLS (ignorar errores en los archivos .env*), También el error SC2034
      local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
      opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, res, ...)
            local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
            if not file_name:match("^%.env") then
              return on_publish_diagnostics(err, res, ...)
            end
          end,
        },
      })
    end,
  },
}
