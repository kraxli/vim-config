
require('telescope').load_extension('dap')

local dap = require('dap')

-- The `terminal_win_cmd` defaults to `belowright new` other options e.g.  '50vsplit new'
dap.defaults.fallback.terminal_win_cmd = 'belowright new'

-- dap.configurations.python = {
--   {
--     type = 'python';
--     request = 'launch';
--     name = "Launch file";
--     program = "${file}";
--     pythonPath = function()
--       return '/usr/bin/python3.8'
--     end;
-- 		-- showLog = true;
--   },
-- }

require('dap-python').setup('/usr/bin/python3.8')
require('dap-python').test_runner = 'pytest'

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})


require('plugins.lspconfig')

