local collect = require("nightfox.lib.collect")
local util = require("nightfox.util")

local M = { fox = "nightfox", has_options = false }

local defaults = {
  compile_path = util.join_paths(util.cache_home, "nightfox"),
  compile_file_suffix = "_compiled",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  module_default = true,
  styles = {
    comments = "NONE",
    conditionals = "NONE",
    constants = "NONE",
    functions = "NONE",
    keywords = "NONE",
    numbers = "NONE",
    operators = "NONE",
    strings = "NONE",
    types = "NONE",
    variables = "NONE",
  },
  inverse = {
    match_paren = false,
    visual = false,
    search = false,
  },
  modules = {
    coc = {
      background = true,
    },
    diagnostic = {
      -- This is linked to so much that is needs to be enabled. This is here primarily
      -- for the extra options that can be added with modules
      enable = true,
      background = true,
    },
    native_lsp = {
      enable = util.is_nvim,
      background = true,
    },
    treesitter = util.is_nvim,
  },
}

M.options = collect.deep_copy(defaults)

M.module_names = {
  "aerial",
  "barbar",
  "cmp",
  "coc",
  "dap_ui",
  "dashboard",
  "diagnostic",
  "fern",
  "fidget",
  "gitgutter",
  "gitsigns",
  "glyph_palette",
  "hop",
  "illuminate",
  "lightspeed",
  "lsp_saga",
  "lsp_trouble",
  "mini",
  "modes",
  "native_lsp",
  "neogit",
  "neotest",
  "neotree",
  "notify",
  "nvimtree",
  "pounce",
  "sneak",
  "symbol_outline",
  "telescope",
  "treesitter",
  "tsrainbow",
  "whichkey",
}

function M.set_fox(name)
  M.fox = name
end

function M.set_options(opts)
  opts = opts or {}
  M.options = collect.deep_extend(M.options, opts)
  M.has_options = true
end

function M.reset()
  M.options = collect.deep_copy(defaults)
end

return M
