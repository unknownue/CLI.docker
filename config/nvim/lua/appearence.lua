
-- Appearence settings (only work in terminal)

vim.o.background = 'light'
-- vim.wo.colorcolumn = '80'

-- Neovim Ui Modifier
-- if vim.g.vscode then
--     vim.api.nvim_exec([[
--         " THEME CHANGER
--         function! SetCursorLineNrColorInsert(mode)
--             " Insert mode: blue
--             if a:mode == "i"
--                 call VSCodeNotify('nvim-theme.insert')
--     
--             " Replace mode: red
--             elseif a:mode == "r"
--                 call VSCodeNotify('nvim-theme.replace')
--             endif
--         endfunction
--     
--         augroup CursorLineNrColorSwap
--             autocmd!
--             autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
--             autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
--             autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
--             autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
--             autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
--         augroup END
--     ]], false)
-- else
--    --TODO 
-- end


if vim.g.vscode then
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = '*',
        callback = function()
            local vscode = require('vscode-neovim')
            local mode_info = vim.api.nvim_get_mode()
            local mode = mode_info.mode

            local config = vscode.get_config("workbench.colorCustomizations")
            -- print(config["[Nord Deep]"]["statusBar.background"])

            -- 检测当前是否为普通模式
            if mode == 'n' then
                -- vim.cmd('echom "现在进入普通模式了!"')
                config["[Nord Deep]"]["statusBar.background"] = "#48557a"
                vscode.update_config({"workbench.colorCustomizations"}, {config})
            end

            -- 检测当前是否为插入模式
            if mode == 'i' or mode == 'ic' or mode == 'ix' then
                -- vim.cmd('echom "现在进入插入模式了!"')
                config["[Nord Deep]"]["statusBar.background"] = "#5b74b4"
                vscode.update_config({"workbench.colorCustomizations"}, {config})
            end

            -- 检测当前是否为可视模式
            if mode == 'v' or mode == 'V' or mode == '' then
                -- vim.cmd('echom "现在进入可视模式了!"')
                config["[Nord Deep]"]["statusBar.background"] = "#9d6830"
                vscode.update_config({"workbench.colorCustomizations"}, {config})
            end
        end
    })
end
