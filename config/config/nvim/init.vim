" vim:fdm=marker
" A good engineer invests time in crafting his tools.
"
" Author: Roland Siegbert <roland@siegbert.info>

"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugins: {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.config/nvim/plugged')

"" UI:

" color themes
Plug 'rscircus/acme-colors'
Plug 'robertmeta/nofrils'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'ajgrf/parchment'

"" airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'

" Git signs
Plug 'lewis6991/gitsigns.nvim'

" Web Devicons
Plug 'kyazdani42/nvim-web-devicons'

"" IDE:

" Codeium / Copilot
"Plug 'Exafunction/codeium.vim'

" Rainbow Parentheses
Plug 'luochen1990/rainbow'

" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'

" Switch to the begining and the end of a block by pressing %
Plug 'tmhedberg/matchit'

" Colorize HEX colors
Plug 'norcalli/nvim-colorizer.lua'

" Add indentation guides even on blank lines
"Plug 'lukas-reineke/indent-blankline.nvim'

" Outline
Plug 'stevearc/aerial.nvim'


" Try to identify indentation automatically
Plug 'Darazaki/indent-o-matic'

" Format
Plug 'sbdchd/neoformat'

" Autocomplete
"FIXME: Plug 'ncm1/ncm2'
"FIXME: Plug 'roxma/nvim-yarp'
"FIXME: Plug 'ncm2/ncm2-bufword'
"FIXME: Plug 'ncm2/ncm2-path'
"FIXME: Plug 'ncm2/ncm2-jedi'
"
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'junnplus/lsp-setup.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" https://github.com/weilbith/nvim-code-action-menu#usage
"Plug 'weilbith/nvim-code-action-menu'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Documentation - https://github.com/ms-jpq/coq_nvim#install
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

" Formatter
Plug 'Chiel92/vim-autoformat'

" Git
Plug 'tpope/vim-fugitive'
"Plug 'ruanyl/vim-gh-line'
Plug 'jreybert/vimagit'
Plug 'mhinz/vim-signify'

" Syntastic
"Plug 'scrooloose/syntastic'
" Shows a lightbuld for code action :)
Plug 'kosayoda/nvim-lightbulb'

" Fuzzy find stuff
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sharkdp/fd'

" Search and replace over many files
Plug 'brooth/far.vim'

" Async make
Plug 'neomake/neomake'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " ... and git

" Symbol tree
Plug 'simrat39/symbols-outline.nvim'


" Tmux interop
Plug 'christoomey/vim-tmux-navigator'

" Show trailing and out of place whitespace
Plug 'ntpeters/vim-better-whitespace'

" Scroll position
Plug 'flebel/vim-scroll-position'

" Highlight yank
Plug 'machakann/vim-highlightedyank'

"" Organization:

" Due date in Todos like so: `- do sth <2021-12-12> due: 1w 1d`
Plug 'NFrid/due.nvim'


"" Writing:

" Tranquility
Plug 'junegunn/goyo.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'MDeiml/tree-sitter-markdown'
"Plug 'plasticboy/vim-markdown'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'rwxrob/vim-pandoc-syntax-simple'

" JSON front matter highlight plugin
Plug 'elzr/vim-json'

"" Language Specific:

" nim-lang.org
Plug 'alaviss/nim.nvim'

" go-lang
Plug 'fatih/vim-go'

call plug#end()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}} Plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Basic Settings: {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" colorscheme
let base16colorspace=256
"colorscheme base16-one-light
"colorscheme base16-ia-light
"colorscheme acme
set background=light
let g:gruvbox_italic=1
let g:gruvbox_contrast_light='hard'
colorscheme parchment

" I like green comments
hi Comment guifg=#339933

" True Color Support if it's avaiable in terminal
if has("termguicolors")
        set termguicolors
endif
if has("gui_running")
        set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

" TODO: old love...
"color acme


" Junk
syntax on
set cursorline " highlight cursorline
set encoding=utf-8 nobomb " BOM sucks
set splitright                " split windows always vertically
set mouse=a                   " respect the mouse
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter`
set showmatch                   " show matches
set gdefault                    " replacing globally is default
set incsearch                   " incremental searching
set hlsearch
set number                    " show current line number on the left
set relativenumber            " show all other line numbers relative
set autoindent " keep indent from line to line
set expandtab " Expand tabs to spaces
set backspace=indent,eol,start
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

" Handling Undo/Backup/Swap: {{{
" Create ~/.config/nvim/files if not existing
if exists('*mkdir') && !isdirectory($HOME.'/.config/nvim/files')
        call mkdir($HOME.'/.config/nvim/files')
        call mkdir($HOME.'/.config/nvim/files/backup')
        call mkdir($HOME.'/.config/nvim/files/undo')
        call mkdir($HOME.'/.config/nvim/files/info')
endif

if has('persistent_undo')
        set undofile             " creates a <FILENAME>.un~ for eternal editing
        set undolevels=1000
        set undodir=$HOME/.config/nvim/files/undo/
        set undoreload=10000
endif

set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set noswapfile " because there is git
" }}}

" ignore a bunch of files
set wildmode=list:longest,list:full       " show all
set wildignore+=*.a,*.o
set wildignore+=*.mod "Fortran
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX

silent! helptags ALL          " Generate help tags automatically

" Integrated Terminal configuration
"
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
        split term://zsh
        resize 10
endfunction
nnoremap <leader>:call OpenTerminal()<CR>

" Speed up transition from modes
if !has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
        augroup END
endif

" Word Processor Mode
augroup word_processor_mode
        autocmd!

        function! WordProcessorMode() " {{{
                setlocal formatoptions=t1
                map j gj
                map k gk
                setlocal smartindent
                setlocal spell spelllang=en_ca
                setlocal noexpandtab
                setlocal wrap
                setlocal linebreak
                Goyo 100
        endfunction " }}}
        com! WP call WordProcessorMode()
augroup END

" }}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}} Basic Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keyboard Shortcuts: {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let mapleader = ","
let maplocalleader = "\<Space>"

" Navigate visual lines instead of logical ones
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap ^ g^

" Curosorline
":hi CursorLine ctermbg=white guibg=white cterm=none gui=none
:nnoremap <leader>H :set cursorline!<CR>

" Edit this file
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>lrc <C-w><C-v><C-l>:e ~/.vimrc_local<cr>

" Window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Strip trailing whitespace
nmap <leader>tw :StripWhitespace<cr>

" Switch between various tab-expansions
:nmap <leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap <leader>tc :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap <leader>t8 :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap <leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Insert timestamp
nmap <F7> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F7> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
smap <F7> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Highlight/Unhighlight search
nmap <leader>h :set nohlsearch!<cr>
noremap / /\v
vnoremap / /\v

" Speed up viewport scroll
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>`

noremap <leader>W :w !sudo tee %<CR> " sudo write

map <leader>qq :cclose<CR> " close quickfix window

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}} Keyboard Shortcuts
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugins Settings: {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

"" Rainbow:
let g:rainbow_active = 1  "or :RainbowToggle

"" Telescope:

lua << EOF
require('telescope').setup {
        fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "ignore_case",
                }
        }
EOF

nnoremap <c-p> :Telescope find_files<cr>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>

"" Neomake:
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)


"" NERDTree:
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<cr>
map <leader>nf :NERDTreeFind<cr>
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 35
let g:NERDTreeGitStatusWithFlags = 1

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
        if &modifiable && expand('%:e') == '.git/COMMIT_EDITMSG' && strlen(expand('%')) > 0 && !&diff
                NERDTreeFind
                wincmd p
        endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Close NERDTree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"" TmuxNavigator:
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>


"" Markdown:
" plasticboy
" " disable header folding
" let g:vim_markdown_folding_disabled = 1
"
" " do not use conceal feature, the implementation is not so good
" let g:vim_markdown_conceal = 0
"
" " disable math tex conceal feature
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
"
" " support front matter of various format
" let g:vim_markdown_frontmatter = 1  " for YAML format
" let g:vim_markdown_toml_frontmatter = 1  " for TOML format
" let g:vim_markdown_json_frontmatter = 1  " for JSON format

" vim-autoformat
noremap <F3> :Autoformat<CR>

" NCM2
"FIXME: augroup NCM2
"FIXME:   autocmd!
"FIXME:
"FIXME:   " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
"FIXME:   " found' messages
"FIXME:   set shortmess+=c
"FIXME:
"FIXME:   " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"FIXME:   inoremap <c-c> <ESC>
"FIXME:
"FIXME:   " When the <Enter> key is pressed while the popup menu is visible, it only
"FIXME:   " hides the menu. Use this mapping to close the menu and also start a new
"FIXME:   " line.
"FIXME:   inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"FIXME:
"FIXME:   " Use <TAB> to select the popup menu:
"FIXME:   inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"FIXME:   inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"FIXME:
"FIXME:   " enable ncm2 for all buffers
"FIXME:   autocmd BufEnter * call ncm2#enable_for_buffer()
"FIXME:
"FIXME:   " :help Ncm2PopupOpen for more information
"FIXME:   set completeopt=noinsert,menuone,noselect
"FIXME:
"FIXME:   " When the <Enter> key is pressed while the popup menu is visible, it only
"FIXME:   " hides the menu. Use this mapping to close the menu and also start a new line.
"FIXME:   inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"FIXME:
"FIXME:   " Don't flicker in my face too much
"FIXME:   let g:ncm2#complete_delay=180 "delay in ms
"FIXME:
"FIXME:   " uncomment this block if you use vimtex for LaTex
"FIXME:   " autocmd Filetype tex call ncm2#register_source({
"FIXME:   "           \ 'name': 'vimtex',
"FIXME:   "           \ 'priority': 8,
"FIXME:   "           \ 'scope': ['tex'],
"FIXME:   "           \ 'mark': 'tex',
"FIXME:   "           \ 'word_pattern': '\w+',
"FIXME:   "           \ 'complete_pattern': g:vimtex#re#ncm2,
"FIXME:   "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"FIXME:   "           \ })
"FIXME: augroup END

"" Airline:
let g:airline_theme='sol'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

"" Lualine:
lua << END
require'lualine'.setup{
        options = {
                theme = 'onelight',
                section_separators = '|',
                component_separators = '',
                disabled_filetypes = {}
                },
        sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch'},
                lualine_c = {'filename'},
                lualine_x = {
                        { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
                        'encoding',
                        'filetype'
                        },
                lualine_y = {'progress'},
                lualine_z = {'location'}
                },
        inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
                },
        tabline = {},
        extensions = {'fugitive'}
}
END

"" Syntastic.vim: {{{
augroup syntastic_config
        autocmd!
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_ruby_checkers = ['mri', 'rubocop']
augroup END
" }}}
"
" 💡 always
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

"" Signify:
set updatetime=100

"" LSP
lua << EOF
require('lsp-setup').setup({
    -- Default mappings
    gD = 'lua vim.lsp.buf.declaration()',
    gd = 'lua vim.lsp.buf.definition()',
    gt = 'lua vim.lsp.buf.type_definition()',
    gi = 'lua vim.lsp.buf.implementation()',
    gr = 'lua vim.lsp.buf.references()',
    K = 'lua vim.lsp.buf.hover()',
    ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    ['<space>e'] = 'lua vim.diagnostic.open_float()',
    ['[d'] = 'lua vim.diagnostic.goto_prev()',
    [']d'] = 'lua vim.diagnostic.goto_next()',
    default_mappings = true,
    -- Custom mappings, will overwrite the default mappings for the same key
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {},
    -- Global on_attach
    on_attach = function(client, bufnr)
        -- Support custom the on_attach function for global
        -- Formatting on save as default
        require('lsp-setup.utils').format_on_save(client)
    end,
    -- Global capabilities
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- pylsp = {},
        pylsp = {},
        marksman = {},
        rust_analyzer = {
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        loadOutDirsFromCheck = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        },
    },
})

-- protocol.CompletionItemKind = {
--         '', -- Text
--         '', -- Method
--         '', -- Function
--         '', -- Constructor
--         '', -- Field
--         '', -- Variable
--         '', -- Class
--         'ﰮ', -- Interface
--         '', -- Module
--         '', -- Property
--         '', -- Unit
--         '', -- Value
--         '', -- Enum
--         '', -- Keyword
--         '﬌', -- Snippet
--         '', -- Color
--         '', -- File
--         '', -- Reference
--         '', -- Folder
--         '', -- EnumMember
--         '', -- Constant
--         '', -- Struct
--         '', -- Event
--         'ﬦ', -- Operator
--         '', -- TypeParameter
--         }


require("symbols-outline").setup(
{
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
)

-- Aerial
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!left<CR>')

EOF

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}} Plugins Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Automatically source $MYVIMRC after save
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
