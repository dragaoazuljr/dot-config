local status, lualine = pcall(require, 'lualine') 
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true,
      path = 0
    } },
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
      'filetype'
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ 
      'filename',
      file_status = true,
      path = 1
    }},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_x = {},
  },
  tabline = {},
  extensions = { 'fugitive' }
}
