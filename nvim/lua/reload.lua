function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^plugin') and not name:match('nvim-tree') and not name:match('lualine') then
      package.loaded[name] = nil
    end
   if name:match('^lua') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end 
    if name:match('^after') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
