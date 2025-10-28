-- Resize height to given percentage
vim.api.nvim_create_user_command("Rsh", function(opts)
  local percent = tonumber(opts.args)
  if not percent then return end
  local total = vim.o.lines - vim.o.cmdheight
  local target = math.floor(total * percent / 100)
  vim.api.nvim_win_set_height(0, target)
end, { nargs = 1 })

-- Resize width to given percentage
vim.api.nvim_create_user_command("Rsw", function(opts)
  local percent = tonumber(opts.args)
  if not percent then return end
  local total = vim.o.columns
  local target = math.floor(total * percent / 100)
  vim.api.nvim_win_set_width(0, target)
end, { nargs = 1 })

