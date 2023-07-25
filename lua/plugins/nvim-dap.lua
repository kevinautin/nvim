return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug File",
            runtimeExecutable = "ts-node",
            program = "${file}",
            console = "integratedTerminal",
            runtimeArgs = { "-r", "dotenv/config", "-r", "${workspaceFolder}/src/loadModuleAliases.js" },
            cwd = "${workspaceFolder}",
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Run Server",
            runtimeExecutable = "ts-node",
            program = "${workspaceFolder}/src/app.js",
            console = "integratedTerminal",
            restart = true,
            internalConsoleOptions = "neverOpen",
            -- runtimeArgs = { "-r", "dotenv/config", "-r", "${workspaceFolder}/src/loadModuleAliases.js" },
            cwd = "${workspaceFolder}",
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          },
          -- {
          --   type = "pwa-node",
          --   request = "launch",
          --   name = "Launch file",
          --   program = "${file}",
          --   cwd = "${workspaceFolder}",
          -- },
          -- {
          --   type = "pwa-node",
          --   request = "attach",
          --   name = "Attach",
          --   processId = require("dap.utils").pick_process,
          --   cwd = "${workspaceFolder}",
          -- },
        }
      end
    end,
  },
}
