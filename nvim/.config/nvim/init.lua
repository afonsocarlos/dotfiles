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

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "

-- Improve startup time for Neovim
vim.loader.enable()

require "afonsocarlos.options"
require "afonsocarlos.keymap"
require "afonsocarlos.augroups"
require "afonsocarlos.lazy"

vim.cmd.colorscheme "catppuccin-mocha"
