-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tommcdo/vim-exchange'
  use {'nathom/filetype.nvim'}
  use 'gpanders/editorconfig.nvim'
  use {"akinsho/toggleterm.nvim"}
  use 'jose-elias-alvarez/null-ls.nvim'
  use  'mfussenegger/nvim-lint'

  use {
      "mbbill/undotree",
      config = function()
        vim.cmd [[nnoremap <leader>gu :UndotreeShow<CR>]]
      end,
      keys = "<leader>gu",
  }
  use {
  'lewis6991/spaceless.nvim',
	config = function()
	  require'spaceless'.setup()
	end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'Yggdroot/indentLine'
  use {
	"SmiteshP/nvim-gps",
	config = function()
		require("nvim-gps").setup({})

	end,
	requires = "nvim-treesitter/nvim-treesitter"
    }
    use {'mattn/emmet-vim'}
  use  {'hoschi/yode-nvim'}
  use 'chip/vim-fat-finger'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
   use {'tpope/vim-speeddating'}
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'rhysd/conflict-marker.vim'
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- use 'ludovicchabant/vim-gutentags'
  -- Automatic tags management
  use 'liuchengxu/vista.vim'
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- use {
  -- "nvim-telescope/telescope-frecency.nvim",
	  -- config = function()
	    -- require"telescope".load_extension("frecency")
	  -- end,
  --    requires = {"tami5/sqlite.lua"}
  -- }
  use 'pgdouyon/vim-yin-yang'
  -- If you are using Packer
  use 'ishan9299/modus-theme-vim'
  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
    }
    use {
    "nanozuki/tabby.nvim",
    config = function() require("tabby").setup() end,
     }
     use {
  "narutoxy/dim.lua",
  requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  config = function()
    require('dim').setup()
  end
}
  use 'folke/lsp-colors.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'mg979/vim-visual-multi'
  use 'norcalli/nvim-colorizer.lua'
  use {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
    -- branch = "patch-1",
  }
use {
  "ur4ltz/surround.nvim",
  config = function()
    require"surround".setup {mappings_style = "surround"}
  end
}

  --  Database
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }

  use 'ggandor/lightspeed.nvim'
  -- use {
  -- 'phaazon/hop.nvim',
  -- branch = 'v1', -- optional but strongly recommended
  -- config = function()
  --   -- you can configure Hop the way you like here; see :h hop-config
  --   require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  -- end
  -- }

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }

  use 'ryanoasis/vim-devicons'
  use {
   'itchyny/lightline.vim',
  requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'TimUntersberger/neogit', requires = {
	'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim' }
  }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use { 'nvim-treesitter/nvim-treesitter-refactor' }

  use {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'}
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Collection of configurations for built-in LSP client
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use {
    "brymer-meneses/grammar-guard.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
  }
  -- Debugging
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'mfussenegger/nvim-dap-python'}
    use 'theHamsta/nvim-dap-virtual-text'
    use "Pocco81/DAPInstall.nvim"
    use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  -- Autocompletion plugin
  use {
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'lukas-reineke/cmp-rg'
  }
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind-nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Illuminate same words
  use 'RRethy/vim-illuminate'
  -- Git project management
  use 'cljoly/telescope-repo.nvim'
  use 'airblade/vim-rooter'
  -- Schemastore
  use "b0o/schemastore.nvim"
  -- Terminals
  use 'kassio/neoterm'

  --  Jupiter
	use 'untitled-ai/jupyter_ascending.vim'
	use 'bfredl/nvim-ipy'
	use 'hkupty/iron.nvim'
	use 'GCBallesteros/jupytext.vim'
	use 'kana/vim-textobj-line'
	use 'kana/vim-textobj-user'
	use 'GCBallesteros/vim-textobj-hydrogen'
end)

vim.cmd [[ set clipboard+=unnamedplus ]]
vim.cmd [[ set linebreak breakindent ]]
vim.g['rooter_cd_cmd'] = 'lcd'
--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true


--Enable mouse mode
-- vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true
vim.o.hidden = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 520
vim.wo.signcolumn = 'yes'
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.scrolljump = 5
vim.o.showtabline = 2

--Set colorscheme (order is important here)
vim.o.termguicolors = true
 -- colorscheme zenbones
vim.cmd [[
set background=light
syntax on
colorscheme zenbones

hi clear CursorLineNr
hi CursorLineNr gui=bold
]]

vim.g.lightline = {
  -- colorscheme = 'solarized',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

require'colorizer'.setup()
local actions = require "telescope.actions"
-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },

      i = {
	       ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
require('telescope').load_extension('dap')

project_files = function(opts)
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

-- Debugging
require("nvim-dap-virtual-text").setup()
local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>bb', [[<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false}))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua project_files(require('telescope.themes').get_dropdown({ previewer = false, winblend=7, width = 1}))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false}))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>*', [[<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({ previewer = false, search = vim.fn.expand("<cword>")}))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', [[<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({ previewer = false,  search = vim.fn.expand("<cword>"), cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }))<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gl', [[<cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({ previewer = false,  search = vim.fn.expand("<cword>"), cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gz', [[<cmd>lua require('telescope.builtin').git_stash(require('telescope.themes').get_dropdown({ previewer = false,  search = vim.fn.expand("<cword>"), cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>oc', [[<cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({ previewer = false }))<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>Vista!!<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>wtn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wtk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wTAB', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wtj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wto', ':tabo<CR>', { noremap = true })

vim.cmd [[
nnoremap <leader>bd :bd<cr>
nnoremap <leader>; <cmd>Telescope commands theme=dropdown<cr>
nnoremap <leader>pp <cmd>Telescope repo list theme=dropdown<cr>
nnoremap <leader>op <cmd>NvimTreeToggle<cr>
nnoremap <leader>ot <cmd>Ttoggle<cr>
nnoremap <leader>ctt <cmd>Ultest<cr>
nnoremap <leader>cf <cmd>Format<cr>
nnoremap ]t <Plug>(ultest-next-fail)
nnoremap [t <Plug>(ultest-prev-fail)
nnoremap <leader>gm <cmd>Neogit kind=vsplit<cr>
nnoremap : ;
nnoremap ; :

nnoremap <leader>fs <cmd>up<cr>
inoremap jj <ESC>

nnoremap <leader>wj <C-W><C-j>
nnoremap <leader>wk <C-W><C-k>
nnoremap <leader>wh <C-W><C-h>
nnoremap <leader>wl <C-W><C-l>
nmap <leader>gb <cmd>Git blame<CR>

inoremap <leader>wh <C-\><C-N><C-w>h
inoremap <leader>wj <C-\><C-N><C-w>j
inoremap <leader>wk <C-\><C-N><C-w>k
inoremap <leader>wl <C-\><C-N><C-w>l
nnoremap <leader>ws <C-W>s
nnoremap <leader>wv <C-W>v
nnoremap <leader>cx <cmd>TroubleToggle<cr>
nnoremap <leader>cs <cmd>Vista<cr>
nnoremap <leader>fp :e $MYVIMRC<cr>
nnoremap <leader>tz <cmd>ZenMode<cr>
" nnoremap gs<leader>p <cmd>HopPattern<cr>
" nnoremap gs<leader> <cmd>HopChar1<cr>
]]

vim.g.nvim_ipy_perform_mappings = 0
vim.g.ipy_celldef = '# %%'

local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    venv_python = {
      command =  "poetry run ipython"
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "venv_python",
  }
}

vim.cmd[[

nnoremap <silent> <leader>odu :DBUIToggle<CR>
nnoremap <silent> <leader>odf :DBUIFindBuffer<CR>
nnoremap <silent> <leader>odr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>odl :DBUILastQueryInfo<CR>

nnoremap <silent><leader>ors <Plug>(iron-visual-send)
nnoremap <silend><leader>orl <Plug>(iron-send-line)

map <silent><leader>oiy <Plug>(IPy-Run)
map <leader>rc <Plug>(IPy-RunCell)
]]

vim.cmd [[nmap ]x ctrih/^# %%<CR><CR>]]
vim.cmd [[nmap [x ctrah/^# %%<CR><CR>]]


local neogit = require("neogit")

neogit.setup {
  use_magit_keybindings = true,
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use {
    --   'TimUntersberger/neogit',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim'
    --   }
    -- }
    --
    diffview = true
  },
}

require('yode-nvim').setup({})

vim.cmd [[
map <Leader>yr :YodeCreateSeditorReplace<CR>
map <Leader>yc :YodeCreateSeditorFloating<CR>
map <Leader>ym :YodeFloatToMainWindow<CR>
map <Leader>yf :YodeCloneCurrentIntoFloat<CR>
map <Leader>bd :YodeBufferDelete<cr>
imap <Leader>bd <esc>:YodeBufferDelete<cr>
]]

require"lsp-colors".setup {}
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- LSP settings
local lspconfig = require 'lspconfig'
require("grammar-guard").init()
local on_attach = function(_, bufnr)
  require "lsp_signature".on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
	    on_attach = on_attach,
	    capabilities = capabilities,
    }
    if server.name == 'jsonls' then
	    opts.settings = {
		    json = {
		      schemas = require('schemastore').json.schemas(),
		    },
	    }
    end

    if server.name == "ltex" then
	    opts.settings = {

			enabled = { "latex", "tex", "bib", "markdown" },
			language = "en",
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			trace = { server = "verbose" },
			dictionary = {},
			disabledRules = {},
			hiddenFalsePositives = {},
	    }
    end

    if server.name == "sumneko_lua" then
      opts.settings = {
	    Lua = {
	      diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = { 'vim' },
	      },
	      workspace = {
		-- Make the server aware of Neovim runtime files
		library = vim.api.nvim_get_runtime_file('', true),
	      },
	      -- Do not send telemetry data containing a randomized but unique identifier
	      telemetry = {
		enable = false,
	      },
	    },
       }
    end
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- Example custom server
    server:setup(opts)
end)

-- Example custom server
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name =  'rg' },
    { name = 'path' },
  },
}

-- global mark I for last edit
vim.cmd [[autocmd InsertLeave * execute 'normal! mI']]

vim.g.VM_Maps = {}

vim.g.VM_Maps['Find Under'] = 'n'
-- vim.g.VM_Maps['Find Subword Under'] = 'd'
vim.g.VM_leader = "gz"

-- Terminal
vim.g.neoterm_default_mod='belowright' -- open terminal in bottom split
vim.g.neoterm_size=16 -- terminal split size
vim.g.neoterm_autoscroll=1  --scroll to the bottom when running a command

require("toggleterm").setup({})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	dir="git_dir",
	cmd = "lazygit",
	direction = "float",
	hidden = true,
	-- on_open = function(term)
	--   vim.cmd("startinsert!")
	--   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	-- end,

})
local lazydocker = Terminal:new({
	cmd = "lazydocker",
	dir="git_dir",
	direction = "float",
	hidden = true,
	on_open = function(term)
	  vim.cmd("startinsert!")
	  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	end,
})


function _lazydocker_toggle()
  lazydocker:toggle()
end

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>od", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})

vim.cmd[[
  tnoremap jj <C-\><C-n>
  :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
]]

vim.cmd [[
augroup VimReload
    autocmd!
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END

au FileType help wincmd L
]]

-- Autoformat
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.trim_whitespace,
	null_ls.builtins.formatting.trim_newlines,
	null_ls.builtins.diagnostics.editorconfig_checker,
	null_ls.builtins.formatting.codespell,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.prismaFmt,
	-- null_ls.builtins.formatting.eslint,
	null_ls.builtins.formatting.cmake_format,
	null_ls.builtins.formatting.black,
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
	sources = sources })

-- vim.cmd [[
-- au BufWritePost <buffer> lua require('lint').try_lint()
-- ]]

vim.cmd[[
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]

-- Tags
vim.g.vista_default_executive = 'nvim_lsp'
