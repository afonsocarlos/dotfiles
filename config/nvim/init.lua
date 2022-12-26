--
--      __ _ / _| ___  _ __  ___  ___   ___ __ _ _ __| | ___  ___
--     / _` | |_ / _ \| '_ \/ __|/ _ \ / __/ _` | '__| |/ _ \/ __|
--    | (_| |  _| (_) | | | \__ \ (_) | (_| (_| | |  | | (_) \__ \
--     \__,_|_|  \___/|_| |_|___/\___/ \___\__,_|_|  |_|\___/|___/
--
--                           _                              __ _
--     _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
--    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
--    | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
--    |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
--                                                               |___/

require "afonsocarlos.globals"

if require "afonsocarlos.first_load"() then
    return
end

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "

require "afonsocarlos.plugins"
require "afonsocarlos.options"
require "afonsocarlos.augroups"

vim.g.do_filetype_lua = 1