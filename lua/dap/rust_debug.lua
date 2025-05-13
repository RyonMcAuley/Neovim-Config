-- Rust debugging configuration for nvim-dap with codelldb
local M = {}

function M.setup()
    local dap = require("dap")
    
    -- Set codelldb installation path from mason
    local codelldb_path = "/home/ryon/.local/share/nvim/mason/packages/codelldb/extension/"
    local codelldb_executable = codelldb_path .. "adapter/codelldb"
    local liblldb_path = codelldb_path .. "lldb/lib/liblldb.so" -- Adjust for macOS if needed: liblldb.dylib
    
    -- Helper function to get executable name from current file
    local function get_executable_from_current_file()
        -- Get the name of the Cargo package
        local cargo_toml = vim.fn.findfile('Cargo.toml', '.;')
        if cargo_toml == '' then return nil end
        
        -- Read Cargo.toml to get package name
        local lines = vim.fn.readfile(cargo_toml)
        local package_name
        for _, line in ipairs(lines) do
            local name = line:match('^name%s*=%s*"([^"]+)"')
            if name then
                package_name = name
                break
            end
        end
        
        if not package_name then
            -- Fallback to directory name if package name not found
            package_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        end
        
        return vim.fn.getcwd() .. '/target/debug/' .. package_name
    end

    -- Program selection function
    local function select_executable()
        local default_executable = get_executable_from_current_file()
        if not default_executable then
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end
        
        local choices = {
            '1. Current File (' .. default_executable .. ')',
            '2. Select Another File',
        }
        
        local choice = vim.fn.inputlist(choices)
        if choice == 1 then
            return default_executable
        elseif choice == 2 then
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        else
            return default_executable
        end
    end
    
    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            command = codelldb_executable,
            args = { "--port", "${port}" },
            -- For Windows uncomment and adjust this:
            -- detached = false,
        }
    }
    
    dap.configurations.rust = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = select_executable,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
        },
        {
            name = "Attach to process",
            type = "codelldb",
            request = "attach",
            processId = require('dap.utils').pick_process,
            program = select_executable,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }
end

return M

