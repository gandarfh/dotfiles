-- general
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
lvim.format_on_save = true
lvim.log.level = "warn"
lvim.colorscheme = "viscond"
lvim.transparent_window = true

vim.opt.colorcolumn = "99999"

-- to change <localleader> of conjure
local mapleader = ";"
vim.g.mapleader = mapleader
vim.g.maplocalleader = mapleader

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<S-A-j>"] = "yyp"
lvim.keys.normal_mode["<S-A-k>"] = "yyP"
lvim.keys.insert_mode["kk"] = "<ESC>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true


-- Lualine
lvim.builtin.lualine.options.theme = "horizon"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_c = { "filename" }
lvim.builtin.lualine.sections.lualine_y = { "progress" }
lvim.builtin.lualine.sections.lualine_z = { "location" }
lvim.builtin.lualine.component_separators = { left = '|', right = '|' }
lvim.builtin.lualine.section_separators = { left = '|', right = '|' }

-- lvim.builtin.nvimtree._setup_called = false
lvim.builtin.nvimtree.active = true


lvim.builtin.dap.active = true


lvim.plugins = {
  { "rcarriga/nvim-dap-ui" },
  { "edluffy/hologram.nvim" },
  { "Olical/conjure" },
  { "gandarfh/viscond" },
  { "kdheepak/lazygit.nvim" },
  { "elvessousa/sobrio" },
  { "nkrkv/nvim-treesitter-rescript" },
  { "rescript-lang/vim-rescript" },
  { "lunarvim/colorschemes" },
  { "nacro90/numb.nvim" },
  { "alvan/vim-closetag" },
  { "mxw/vim-jsx" },
  { "windwp/nvim-ts-autotag" },
  { "tpope/vim-surround" },
  { "norcalli/nvim-colorizer.lua" },
  { "editorconfig/editorconfig-vim" },
  { "mateusbraga/vim-spell-pt-br" },
  { "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}

lvim.builtin.telescope.extensions = {
  media_files = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    filetypes = { "png", "webp", "jpg", "jpeg" },
    find_cmd = "rg" -- find command (defaults to `fd`)
  }
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "arecibo")
  pcall(telescope.load_extension, "media_files")
end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "eslint_d",
    filetypes = { "markdown", "rescript", "html", "typescript", "typescriptreact", "javascript", "javascriptreact" } },
  { exe = "prettierd",
    filetypes = { "markdown", "rescript", "html", "typescript", "typescriptreact", "javascript", "javascriptreact" } }
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = 'eslint_d',
    filetypes = { "typescript", "rescript", "typescriptreact", "javascript", "javascriptreact" } }
}

-- Custom plugins
local autotag = require "nvim-ts-autotag"
autotag.setup()

local colorizer = require "colorizer"
colorizer.setup()

-- local rooter = require "lsp-rooter"
-- rooter.setup()

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.alpha.dashboard.section.footer.val = {
  [[]]
}

lvim.builtin.alpha.dashboard.section.header.val = {
  [[                                   ]],
  [[                                   ]],
  [[                                   ]],
  [[                                   ]],
  [[                                   ]],
  [[                                   ]],
  [[                                   ]],
  [[            ▒▓▓▓▓▓▓▓▓▓▓▒           ]],
  [[          ▒▓░░░░░░░░░░░░▓▒▒        ]],
  [[         ▒█░░░░░░░░░░░░░░▒▒▓       ]],
  [[        ▓▓░░░░░▒██░░░░██░░▒▓▒          o------o ]],
  [[        ▓▓░░░░░▒ ▓░░░░ ▓░░░▒█          | JOAO | ]],
  [[        ▓▓░░░░░░░░░▒▓▒░░░░░▒█          |------| ]],
  [[        ▓▓░░▒▒▒▒░░░░░░░░░░░▒█▒         | JAUM | ]],
  [[   ▒▓▒▒▒▒░░░░░▒▒░░░░░░░░░░░░░░▓▒       o------o ]],
  [[  ▓▓░▒▒░░░░▒▒▒░░░░░░░░░░░░▒▓▓▓▒          ]],
  [[  ▓▓░░░░░░░░░░░░░░░░░░░░░▓▓              ]],
  [[   ▒▓░░░░░░░░░░░░░░░░░░▒▓▒               ]],
  [[    ▒▓░░░░░░░░░░░░░░░░▓▒           ]],
  [[      ▒▓▒▒▒▒▒▒▒▒▒▒▒▓▓▒             ]],
  [[                                   ]]
}
