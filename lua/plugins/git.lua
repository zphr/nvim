return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
        mappings = {
          -- modify status buffer mappings
          finder = {
            ["<C-j>"] = "Next",
            ["<C-k>"] = "Previous",
          },
          status = {
            ["<C-j>"] = "GoToNextHunkHeader",
            ["<C-k>"] = "GoToPreviousHunkHeader",
          },
        },
      })
    end,
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "tpope/vim-rhubarb"
  }
}