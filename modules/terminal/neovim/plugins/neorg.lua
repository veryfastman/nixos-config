require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},

    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    };

    ["core.dirman"] = {
      config = {
        workspaces = {
          school = "~/Documents/school",
          notes = "~/Documents/notes",
          learning = "~/Documents/learning"
        }
      }
    }
  }
}
