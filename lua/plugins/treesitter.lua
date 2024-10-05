return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            auto_install = true,
            indent = { enable = true },
            ensure_installed = {
                "lua",
                "vim",
            },
            modules = {},
            sync_install = false,
            ignore_install = {},
        })
    end,
}
