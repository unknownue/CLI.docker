
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

-- Add absolute search path
package.path = package.path .. ";/Users/sylveon/Dev/.dotfiles/config/nvim/?.lua;"
-- print(package.path)

-- Basic configration
require('lua.config')
-- Appearence settings (only work in terminal)
require('lua.appearence')
-- Customized functions
require('function')
-- Load plugins
require('lua.plugs')
-- Keyboard settings
require('lua.colemak')

print('Configuration load succeed...')

