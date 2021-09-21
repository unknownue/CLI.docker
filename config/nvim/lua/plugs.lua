
-- -------------------------------------------------------------------------
-- Plugin configuration for common development
--
--  _   _                 _               ____             __ _
-- | \ | | ___  _____   _(_)_ __ ___     / ___|___  _ __  / _(_) __ _
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   | |   / _ \| '_ \| |_| |/ _` |
-- | |\  |  __/ (_) \ V /| | | | | | |  | |__| (_) | | | |  _| | (_| |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|   \____\___/|_| |_|_| |_|\__, |
--                                                               |___/
-- 
-- -------------------------------------------------------------------------


local plugin_path = vim.env.XDG_CONFIG_HOME .. '/nvim/autoload/plug.vim'
if not file_exists(plugin_path) then
    local download_cmd = 'curl -fLo ' .. plugin_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    os.execute(download_cmd)
    print('Download plug.vim from vim-plug. May be "PlugInstall/PlugUpdate is needed."')
end


local Plug = vim.fn['plug#']

vim.call('plug#begin', '$XDG_CONFIG_HOME/nvim/plugs')

Plug 'AndrewRadev/sideways.vim'  -- switch function parameters
Plug 'AndrewRadev/splitjoin.vim' -- switching statement between single-line and multi-lines
Plug 'machakann/vim-highlightedyank'  -- hint for copied text
Plug 'junegunn/vim-easy-align'  -- Vim alignment plugin

vim.call('plug#end')
