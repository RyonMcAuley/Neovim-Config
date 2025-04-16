-- require('mini.icons').setup({
--   -- You can name these groups however you like
--   custom = {
--     files = {
--       new = "",
--       recent = "",
--       find = "",
--     },
--     ui = {
--       search = "",
--       quit = "󰅚",
--     },
--   },
-- })
--
-- shared/icons.lua
local M = {}

M.documents = {
  NewFile = "", -- You can change this to any icon you prefer
  OpenFile = "",
}

M.ui = {
  Search = "",
  History = "",
  Quit = "󰅚",
}

return M

