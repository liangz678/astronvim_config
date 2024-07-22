-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true, -- sets vim.opt.number
				spell = false, -- sets vim.opt.spell
				signcolumn = "auto", -- sets vim.opt.signcolumn to auto
				wrap = true, -- sets vim.opt.wrap
				showbreak = "↪",
				tabstop = 4,
				clipboard = "",
			},
			g = { -- vim.g.<key>
				-- configure global vim variables (vim.g)
				-- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
				-- This can be found in the `lua/lazy_setup.lua` file
			},
		},
		-- Mappings can be configured through AstroCore as well.
		-- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
		mappings = {
			-- first key is the mode
			n = {
				-- second key is the lefthand side of the map

				-- navigate buffer tabs with `H` and `L`
				["<leader>y"] = { '"+y' },
				["<leader>yy"] = { '"+yy' },
				H = { "^" },
				L = { "$" },
				["<leader>k"] = {
					function()
						local filetype = vim.bo.filetype
						if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
							require("crates").show_popup()
						else
							vim.lsp.buf.hover()
						end
					end,
				},
				["<Leader>uI"] = {
					function()
						-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end,
					desc = "Toggle to inlay_hint",
				},
				-- ["<M-j>"] = { ":m .+1<CR>==" },
				-- ["<M-k>"] = { ":m .-2<CR>==" },

				-- mappings seen under group name "Buffer"
				["<Leader>bD"] = {
					function()
						require("astroui.status.heirline").buffer_picker(function(bufnr)
							require("astrocore.buffer").close(bufnr)
						end)
					end,
					desc = "Pick to close",
				},
				-- tables with just a `desc` key will be registered with which-key if it's installed
				-- this is useful for naming menus
				["<Leader>b"] = { desc = "Buffers" },
				-- quick save
				-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
			},
			v = {
				["<leader>y"] = { '"+y' },
				["<leader>yy"] = { '"+yy' },
				["H"] = { "^" },
				["L"] = { "$" },
			},
			-- x = {
			-- 	["<M-j>"] = { ":m '>+1<CR>gv-gv" },
			-- 	["<M-k>"] = { ":m '<lt>-2<CR>gv-gv" },
			-- },
			-- i = {
			-- 	["<M-j>"] = { "<Esc>:m .+1<CR>==gi" },
			-- 	["<M-k>"] = { "<Esc>:m .-2<CR>==gi" },
			-- },
			t = {
				-- setting a mapping to false will disable it
				-- ["<esc>"] = false,
			},
		},
	},
}
