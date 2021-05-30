local has_harpoon, _ = pcall(require, 'harpoon')
if not has_harpoon then
  error('This plugin requires ThePrimeagen/harpoon')
end

local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

local M = {}

local harpoon_back_buffers = { "", "" }
harpoon_mark.on("changed", function()
  local current_index = harpoon_mark.get_current_index()
  local current_buffer = vim.fn.bufname(vim.fn.bufnr())

  if current_index ~= nil then
    if current_buffer == harpoon_back_buffers[1] then
      harpoon_back_buffers = { current_buffer, harpoon_back_buffers[2] }
    else
      harpoon_back_buffers = { current_buffer, harpoon_back_buffers[1] }
    end
  end
end)

M.go_back = function()
  local currentBuffer = vim.fn.bufname(vim.fn.bufnr())

  if currentBuffer == harpoon_back_buffers[1] then
    harpoon_back_buffers = { harpoon_back_buffers[2], currentBuffer }
  end

  if harpoon_back_buffers[1] ~= nil and harpoon_back_buffers[1] ~= "" then
    harpoon_ui.nav_file(harpoon_mark.get_index_of(harpoon_back_buffers[1]))
  else
    print("No harpoon-back buffer stored yet")
  end
end


return M
