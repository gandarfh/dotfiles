-- general
vim.opt.relativenumber = true
vim.opt.colorcolumn = "99999"
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:block"
vim.opt.updatetime = 0

lvim.use_icons = false
lvim.format_on_save = true
lvim.log.level = "warn"
lvim.colorscheme = "viscond"
-- lvim.transparent_window = false

-- to change <localleader> of conjure
local mapleader = ";"
vim.g.mapleader = mapleader
vim.g.maplocalleader = mapleader

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<S-A-j>"] = "yyp"
lvim.keys.visual_mode["J"] = "yp"
lvim.keys.normal_mode["<S-A-k>"] = "yyP"
lvim.keys.visual_mode["K"] = "yP"
lvim.keys.normal_mode["<leader>r"] = ":lua require('spectre').open()<cr>"
lvim.keys.normal_mode["mm"] = ":Glow<cr>"
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<cr>:UndotreeFocus<cr>"

lvim.keys.insert_mode["kk"] = "<ESC>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.lualine.active = true
lvim.builtin.project.active = false
lvim.builtin.which_key.setup.show_help = false

-- Lualine
lvim.builtin.lualine.options.theme = "horizon"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_c = { "filename" }
lvim.builtin.lualine.sections.lualine_y = { "progress" }
lvim.builtin.lualine.sections.lualine_z = { "location" }
lvim.builtin.lualine.component_separators = { left = '|', right = '|' }
lvim.builtin.lualine.section_separators = { left = '|', right = '|' }

lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.renderer.icons.show.folder = false
lvim.builtin.nvimtree.setup.renderer.icons.show.folder_arrow = false
lvim.builtin.nvimtree.setup.renderer.icons.show.file = false

lvim.builtin.dap.active = true

lvim.plugins = {
  { "ellisonleao/glow.nvim" },
  { "jbyuki/venn.nvim" },
  { "rcarriga/nvim-dap-ui" },
  { "mbbill/undotree" },
  { "gandarfh/viscond" },
  { "kdheepak/lazygit.nvim" },
  { "lunarvim/colorschemes" },
  { "nacro90/numb.nvim" },
  { "alvan/vim-closetag" },
  { "mxw/vim-jsx" },
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-spectre" },
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

require('glow').setup({
  style = "dark",
  width = 120,
  -- your override config
})

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd [[setlocal ve=all]]
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd [[setlocal ve=]]
    vim.cmd [[mapclear <buffer>]]
    vim.b.venn_enabled = nil
  end
end

-- toggle keymappings for venn using <leader>v
lvim.keys.normal_mode["<leader>v"] = ":lua Toggle_venn()<CR>"


require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})


require('spectre').setup({
  color_devicons     = true,
  open_cmd           = 'vnew',
  live_update        = false, -- auto excute search again when you write any file in vim
  line_sep_start     = '┌-----------------------------------------',
  result_padding     = '¦  ',
  line_sep           = '└-----------------------------------------',
  highlight          = {
    ui = "String",
    search = "DiffChange",
    replace = "DiffDelete"
  },
  mapping            = {
    ['toggle_line'] = {
      map = "dd",
      cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
      desc = "toggle current item"
    },
    ['enter_file'] = {
      map = "<cr>",
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = "goto current file"
    },
    ['send_to_qf'] = {
      map = "<leader>q",
      cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
      desc = "send all item to quickfix"
    },
    ['replace_cmd'] = {
      map = "<leader>c",
      cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
      desc = "input replace vim command"
    },
    ['show_option_menu'] = {
      map = "<leader>o",
      cmd = "<cmd>lua require('spectre').show_options()<CR>",
      desc = "show option"
    },
    ['run_current_replace'] = {
      map = "<leader>rc",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line"
    },
    ['run_replace'] = {
      map = "<leader>R",
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = "replace all"
    },
    ['change_view_mode'] = {
      map = "<leader>v",
      cmd = "<cmd>lua require('spectre').change_view()<CR>",
      desc = "change result view mode"
    },
    ['change_replace_sed'] = {
      map = "th",
      cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
      desc = "use sed to replace"
    },
    ['change_replace_oxi'] = {
      map = "th",
      cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
      desc = "use oxi to replace"
    },
    ['toggle_live_update'] = {
      map = "tu",
      cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
      desc = "update change when vim write file."
    },
    ['toggle_ignore_case'] = {
      map = "ti",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "toggle ignore case"
    },
    ['toggle_ignore_hidden'] = {
      map = "th",
      cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
      desc = "toggle search hidden"
    },
    -- you can put your mapping here it only use normal mode
  },
  find_engine        = {
    -- rg is map with finder_cmd
    ['rg'] = {
      cmd = "rg",
      -- default args
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
      options = {
        ['ignore-case'] = {
          value = "--ignore-case",
          icon = "[I]",
          desc = "ignore case"
        },
        ['hidden'] = {
          value = "--hidden",
          desc = "hidden file",
          icon = "[H]"
        },
        -- you can put any rg search option you want here it can toggle with
        -- show_option function
      }
    },
    ['ag'] = {
      cmd = "ag",
      args = {
        '--vimgrep',
        '-s'
      },
      options = {
        ['ignore-case'] = {
          value = "-i",
          icon = "[I]",
          desc = "ignore case"
        },
        ['hidden'] = {
          value = "--hidden",
          desc = "hidden file",
          icon = "[H]"
        },
      },
    },
  },
  replace_engine     = {
    ['sed'] = {
      cmd = "sed",
      args = nil,
      options = {
        ['ignore-case'] = {
          value = "--ignore-case",
          icon = "[I]",
          desc = "ignore case"
        },
      }
    },
    -- call rust code by nvim-oxi to replace
    ['oxi'] = {
      cmd = 'oxi',
      args = {},
      options = {
        ['ignore-case'] = {
          value = "i",
          icon = "[I]",
          desc = "ignore case"
        },
      }
    }
  },
  default            = {
    find = {
      --pick one of item in find_engine
      cmd = "rg",
      options = { "ignore-case" }
    },
    replace = {
      --pick one of item in replace_engine
      cmd = "sed"
    }
  },
  replace_vim_cmd    = "cdo",
  is_open_target_win = true, --open file on opener window
  is_insert_mode     = false -- start open panel on is_insert_mode
})

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "eslint_d",
    filetypes = { "markdown", "rescript", "html", "typescript", "typescriptreact", "javascript", "javascriptreact" } },
  { exe = "goimports",
    filetypes = { "go" } },
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

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = true
-- lvim.lsp.automatic_servers_installation = true

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
