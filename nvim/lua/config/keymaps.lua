-- keys are automatically loaded on the VeryLazy event
-- Default keys that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keys.lua
-- Add any additional keys here
local key = vim.keymap

key.set("n", "z", "<C-r><cr>")
key.set("n", "<leader>nh", ":nohlsearch<cr>")

key.set("n", "<leader>wq", ":wq<CR>") -- save and quit
key.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
key.set("n", "<leader>ww", ":w<CR>") -- save
key.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Harpoon
key.set("n", "<leader>ha", require("harpoon.mark").add_file)
key.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
key.set("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end)
key.set("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end)
key.set("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end)
key.set("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end)
key.set("n", "<leader>5", function()
  require("harpoon.ui").nav_file(5)
end)

-- LSP
key.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
key.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
key.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
key.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
key.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
key.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
key.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
key.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
key.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
key.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
key.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
key.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
key.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
key.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
key.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
key.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Debugging
key.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
key.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
key.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
key.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
key.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
key.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
key.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
key.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
key.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
key.set("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end)
key.set("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end)
key.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
key.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
key.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
key.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
key.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
key.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
key.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
key.set("n", "<leader>go", function()
  if vim.bo.filetype == "java" then
    require("jdtls").organize_imports()
  end
end)

key.set("n", "<leader>gu", function()
  if vim.bo.filetype == "java" then
    require("jdtls").update_projects_config()
  end
end)

key.set("n", "<leader>tc", function()
  if vim.bo.filetype == "java" then
    require("jdtls").test_class()
  end
end)

key.set("n", "<leader>tm", function()
  if vim.bo.filetype == "java" then
    require("jdtls").test_nearest_method()
  end
end)

key.set("n", "<leader>nh", ":nohlsearch<cr>")

key.set("n", "<A-j>", ":m .+1<CR>==") --move line up
key.set("n", "<A-k>", ":m .-2<CR>==") --move line down
key.set("v", "<A-j>", ":m '>+1<CR>gv=gv") --move line up in v
key.set("v", "<A-k>", ":m '<-2<CR>gv=gv") --move line down in v
