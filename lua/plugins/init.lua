return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    -- UFO (Ultra FOld) to fold code blocks
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead",
        opts = {},
        config = function()
        -- Fold options
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 50 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 50
        vim.o.foldenable = true
        require("ufo").setup()
        end,
        -- init = function()
        -- -- Using ufo provider need remap zR and zM. If Neovim is 0.6.1, remap yourself
        -- vim.keymap.set("n", "zR", function()
        -- require("ufo").openAllFolds()
        -- end)
        -- vim.keymap.set("n", "zM", function()
        -- require("ufo").closeAllFolds()
        -- end)
        -- end,
    }
}
