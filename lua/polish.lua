-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

require("lspconfig").typst_lsp.setup {
  root_dir = function() return vim.fn.getcwd() end,
  settings = {
    exportPdf = "onType", -- Choose onType, onSave or never.
    -- serverPath = "" -- Normally, there is no need to uncomment it.
  },
}

vim.cmd [[
  autocmd BufEnter *.slint :setlocal filetype=slint
  " autocmd VimEnter * !im-select.exe 1033
  autocmd InsertEnter * :silent :!im-select.exe 2052
  autocmd InsertLeave * :silent :!im-select.exe 1033
  autocmd VimLeave * :silent: :!im-select.exe 2052

  ]]
