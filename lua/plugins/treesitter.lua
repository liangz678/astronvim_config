if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec

return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		-- add more things to the ensure_installed table protecting against community packs modifying it
		opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
			"lua",
			"vim",
			-- add more arguments for adding more treesitter parsers
		})
		opts.incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- 设置开始增量选择
				node_incremental = "grn", -- 增加选择范围
				scope_incremental = "grc", -- 增加选择范围到整个范围（如函数）
				node_decremental = "grm", -- 减少选择范围
			},
		}
	end,
}
