require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.summary"] = {},
    ["core.ui.calendar"] = {},

    -- Commenting this out until the module works again
    -- ["core.tempus"] = {},

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
