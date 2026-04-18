return {
    "andweeb/presence.nvim",
    config = function()
        require("presence").setup({
            auto_update         = true,
            neovim_image_text   = "The One True Editor",
            main_image          = "neovim",
            show_time           = true,

            editing_text = function(filename)
                -- 1. Check if it's a terminal
                if vim.bo.buftype == 'terminal' then
                    return "Running Build/Tests"
                end

                -- 2. Check for .config directory
                local filepath = vim.fn.expand("%:p")
                if filepath:find(".config") then
                    -- Extract the app folder name (e.g., 'hypr', 'nvim', 'kitty')
                    local config_app = filepath:match(".config/([^/]+)")

                    if config_app then
                        -- Special case for Hyprland
                        if config_app:find("hypr") then
                            return "Ricing Hyprland again"
                        end
                        -- Fallback for all other configs
                        return "Editing config for " .. config_app
                    end
                end

                -- 3. Default fallback for non-config files
                return "Editing " .. (filename or "something secret")
            end,

            workspace_text = function(project_name)
                local project = project_name or "something cool"

                if vim.bo.buftype == 'terminal' then
                    return "In Terminal: " .. project
                end

                -- Check if we are in nvim config specifically
                local filepath = vim.fn.expand("%:p")
                if filepath:find("nvim") then
                    return "Working on Nvim config again!"
                end

                return "Working on " .. project
            end,

            file_explorer_text  = "Navigating files",
            git_commit_text     = "Committing changes",
            plugin_manager_text = "Fixing plugins again",
        })
    end
}
