
-- ----------------------------------------------------------------------
-- Entry point for Neovim
--
--  _   _                 _              ___       _ _
-- | \ | | ___  _____   _(_)_ __ ___    |_ _|_ __ (_) |_
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \    | || '_ \| | __|
-- | |\  |  __/ (_) \ V /| | | | | | |   | || | | | | |_
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|  |___|_| |_|_|\__|
--
--
-- ----------------------------------------------------------------------

-- To see how to translate *.vim to *.lua, see https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- Use 'source config/nvim/init.lua' to reload all config

print('Configuration load begin...')

if vim.loop.os_uname().sysname == "Windows_NT" then
    package.path = package.path .. "C:\\Users\\%USERNAME%\\AppData\\Local\\nvim\\?.lua;C:\\Users\\%USERNAME%\\AppData\\Local\\nvim\\lua\\?.lua;"
    if not vim.g.vscode then
        vim.env.XDG_CONFIG_HOME = "C:\\Users\\%USERNAME%\\AppData\\Local"
    end

    -- Basic configration
    require('config')
    -- Appearence settings (only work in terminal)
    require('appearence')
    -- Customized functions
    require('function')
    -- Load plugins
    require('plugs')
    -- Keyboard settings
    require('colemak')
    -- Macro
    require('macro')
else
    -- Add absolute search path
    package.path = package.path .. ";/Users/unknownue/Develop/dotfiles/config/nvim/?.lua;"
    -- print(package.path)

    if not vim.g.vscode then
        vim.env.XDG_CONFIG_HOME = "/Users/unknownue/Develop/dotfiles/config"
    end

    -- Basic configration
    require('lua.config')
    -- Appearence settings (only work in terminal)
    require('lua.appearence')
    -- Customized functions
    require('lua.function')
    -- Load plugins
    require('lua.plugs')
    -- Keyboard settings
    require('lua.colemak')
    -- Macro
    require('macro')
end

print('Configuration load succeed...')

