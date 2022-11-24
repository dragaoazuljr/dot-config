local status, neogen = pcall(require, 'neogen')
if (not status) then return end

local i = require("neogen.types.template").item

neogen.setup {
  enable = true,
  input_after_comment = true,
  languages = {
    typescript = {
      template = {
        annotation_convention = "tsdoc",
        tsdoc = {
          { nil, "/**", { no_results = true }},
          { nil, " * $1", { no_results = true }},
          { nil, " */", { no_results = true }},

          { nil, "/**", { no_results = true, type = { "file" } } },
          { nil, " * @module $1", { no_results = true, type = { "file" } } },
          { nil, " */", { no_results = true, type = { "file" } } },

          { nil, "/**", { type = { "class", "func" } } },
          { i.ClassName, " * $1", { type = { "class" } } },
          { i.Type, " * @template %s - $1", { type = { "func" } } },
          { i.Parameter, " * @param %s - $1", { type = { "func" } } },
          {
            { i.Parameter },
            " * @param %s - $1",
            { required = i.Tparam, type = { "func" } },
          },
          { i.Return, " * @returns $1", { type = { "func" } } },
          { nil, " */", { type = { "class", "func" } } },
        }
      }
    }
  }
}
