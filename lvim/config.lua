-- general
vim.opt.spell = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.spelllang = { "en", "pt_br" }

vim.opt.showcmd = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "99999"
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:block"
vim.opt.updatetime = 0
-- lvim is the global options object

lvim.use_icons = true
lvim.format_on_save = true
lvim.log.level = "warn"
lvim.colorscheme = "viscond"
-- lvim.transparent_window = false

-- to change <localleader> of conjure
local mapleader = ";"
vim.g.mapleader = mapleader
vim.g.maplocalleader = mapleader

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space" -- add your own keymapping
lvim.keys.normal_mode["<leader>r"] = ":lua require('spectre').open()<cr>"
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<cr>:UndotreeFocus<cr>"
lvim.keys.insert_mode["kk"] = "<ESC>"
lvim.keys.insert_mode["jj"] = "<ESC>"

lvim.builtin["terminal"].persist_size = true

lvim.builtin["terminal"].on_config_done = function()
  local terminal = require("toggleterm.terminal").Terminal
  local httui = terminal:new { cmd = "httui", hidden = true }
  local go = terminal:new { cmd = "go run .", hidden = true }
  local glow = terminal:new { cmd = "glow", hidden = true }


  function _Go_toggle()
    go:toggle()
  end

  function _Httui_toggle()
    httui:toggle()
  end

  function _Glow_toggle()
    glow:toggle()
  end

  vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _Go_toggle()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua _Httui_toggle()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>lua _Glow_toggle()<CR>", { noremap = true, silent = true })
end

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.which_key.active = true
lvim.builtin.which_key.setup.ignore_missing = true
lvim.builtin.alpha.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.renderer.icons.show.folder = false
lvim.builtin.nvimtree.setup.renderer.icons.show.folder_arrow = false
lvim.builtin.nvimtree.setup.renderer.icons.show.file = false

lvim.plugins = {
  { "folke/zen-mode.nvim" },
  { "jbyuki/venn.nvim" },
  { "mbbill/undotree" },
  { "gandarfh/viscond" },
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

require "nvim-ts-autotag".setup()
require "colorizer".setup()

-- set a formatter, this will override the language server formatting capabilities (if it exists)
require "lvim.lsp.null-ls.formatters".setup {
  { exe = "eslint_d",
    filetypes = { "markdown", "rescript", "html", "typescript", "typescriptreact", "javascript", "javascriptreact" } },
  { exe = "goimports",
    filetypes = { "go" } },
  { exe = "prettierd",
    filetypes = { "markdown", "rescript", "html", "typescript", "typescriptreact", "javascript", "javascriptreact" } }
}

-- set additional linters
require "lvim.lsp.null-ls.linters".setup {
  { exe = 'eslint_d',
    filetypes = { "typescript", "rescript", "typescriptreact", "javascript", "javascriptreact" } }
}



-- toggle keymappings for venn using <leader>v
lvim.keys.normal_mode["<leader>v"] = ":lua Toggle_venn()<CR>"

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

lvim.builtin.treesitter.ignore_install = { "haskell" }
