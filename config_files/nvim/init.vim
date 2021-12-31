let install_plugins = 0

"installs vim-plug if not installed
if has('unix') && empty(glob('~/.vim/autoload/plug.vim'))                    
    :! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let install_plugins = 1
elseif has('win32') && empty(glob('~/vimfiles/autoload/plug.vim'))
    :! curl -fLo vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let install_plugins = 1
elseif has('win32') && has('nvim') && empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
    :! curl -fLo AppData/Local/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let install_plugins = 1
elseif has('unix') && has('nvim') && empty(glob('~/.config/nvim/autoload/plug.vim'))
    :! curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let install_plugins = 1
endif

"plugins
let path = '~/.vim/plugged'
if has('nvim') && has('win32')
    let path = '~/AppData/Local/nvim/plugged'
elseif has('nvim') && has('unix')
    let path = '~/.config/nvim/plugged'
endif
call plug#begin(path)

"statusbar & bufferline config
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_separator = ':'
let g:lightline#bufferline#unnamed = 'Untitled'
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'bufnum'],
      \              [ 'lineinfo' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \   'bufnum': '[%n]',
      \   'lineinfo': '%l/%L:%c',
      \ },
      \ }

"match brackets with color
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
\    'guifgs': ['yellow', 'magenta', 'cyan', 'red'],
\    'ctermfgs': ['yellow', 'magenta', 'cyan', 'red'],
\    'guis': [''],
\    'cterms': [''],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

"automatically closes pairs
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutJump = 0
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

"html development
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:user_emmet_leader_key='<C-Z>'
map <c-e> :Emmet-

"syntax highlighting
"Plug 'pangloss/vim-javascript'
"Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'
"let g:python_highlight_all = 1

"show indent level
Plug 'yggdroot/indentline'
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
autocmd TermOpen * IndentLinesDisable

"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
let g:fzf_preview_window = []

nnoremap <C-f> :Files<CR>
nnoremap <leader>f :Files~<CR>
nnoremap <leader>fb :Buffers<CR>

"code commenter
Plug 'preservim/nerdcommenter'
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle

"moving between buffers
Plug 'vim-scripts/bufexplorer.zip'
map <silent> <C-b> :BufExplorer<CR>

"counts the search results
Plug 'henrik/vim-indexed-search'
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1

"auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

inoremap <expr> <TAB> pumvisible() ? "\<DOWN>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<UP>" : "\<TAB>"
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"file browser
Plug 'lambdalisue/fern.vim'
nmap <leader>e :Fern . -drawer -toggle<CR>

"colorscheme
Plug 'joshdick/onedark.vim'

"surround text with brackets, quotes, end etc
Plug 'tpope/vim-surround'

"choose window
Plug 't9md/vim-choosewin'
let g:choosewin_blink_on_land = 0
nmap  <leader>w  <Plug>(choosewin)

"which-key
Plug 'liuchengxu/vim-which-key'
let g:which_key_use_floating_win = 0
nnoremap <silent> <leader> :silent WhichKey '<leader>'<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


Plug 'sedm0784/vim-you-autocorrect'

"for neovim only
if has('nvim')
    "start screen
    Plug 'mhinz/vim-startify'
    let g:startify_enable_special = 0
    let g:startify_custom_header = [
    \ '    _   __                _         ',
    \ '   / | / /__  ____ _   __(_)___ ___ ',
    \ '  /  |/ / _ \/ __ \ | / / / __ `__ \',
    \ ' / /|  /  __/ /_/ / |/ / / / / / / /',
    \ '/_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
    \]
    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
    let g:startify_bookmarks = [
            \ { 'v': '$MYVIMRC' },
            \ ]
    let g:startify_commands = [
        \ {'cc': ['Change Colorscheme', 'Colors']},
        \ {'ff': ['Find Files', 'Files']},
        \ {'fe': ['File Explorer', 'Fern .']},
        \ {'pi': ['Install Plugins', 'PlugInstall']},
        \ {'pc': ['Remove Plugins', 'PlugClean']},
        \ {'co': ['Coc Config', 'CocConfig']},
        \ ]
    let g:startify_custom_footer = "startify#pad(['', 'NVIM ' . matchstr(execute('version'), 'NVIM v\\z\\s[^\\n]\*'), ''])"

    Plug 'kassio/neoterm'
    map <leader>t :Ttoggle<CR>

    Plug 'antoinemadec/FixCursorHold.nvim'
endif

call plug#end()

"lua plugins

if install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    let g:coc_global_extensions = ['coc-vimlsp', 'coc-tsserver', 'coc-prettier', 'coc-html', 'coc-css', 'coc-pyright', 'coc-json', '@yaegassy/coc-pylsp', 'coc-sumneko-lua']
    echo "Done!"
    silent! CocConfig
    q
endif

"basic settings
set updatetime=100
set signcolumn=yes
set colorcolumn=80
set encoding=utf-8
set complete+=kspell
set spelllang=en
set wildmenu
set number
set relativenumber
set expandtab 
set shiftwidth=4
set tabstop=4
set showtabline=2
set scrolloff=10
set laststatus=2
set autoindent
set smartindent
set nowrap
set nobackup
set noswapfile
set noshowmode
set termguicolors
set incsearch
filetype plugin on
filetype indent on
syntax on

"cursorline
if has('nvim')
    set cursorline
endif

"keymappings
"mapping space as the leader key
map <SPACE> <leader>

"exit terminal mode
tnoremap <ESC> <C-\><C-n>

"moving between buffers
nnoremap <TAB> :bn!<CR>
nnoremap <S-TAB> :bp!<CR>

"close buffer
map <c-q> :bd!<CR>

"center cursor
autocmd InsertEnter * norm zz
nnoremap n nzz
nnoremap N Nzz

"open command mode by pressing semi-colon
nmap ; :

"moving between splits
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"keep visual select when tabbing
vmap < <gv
vmap > >gv

"use tabs to indent
vmap <tab> > >gv
vmap <S-tab> < <gv

"paste using yank
nnoremap ,p "0p
nnoremap ,P "0P

"copy and paste using system clipboard
map <leader>p "+p
map <leader>y "+y

"move blocks of text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"resize split window
nnoremap <silent> <M-j> :resize -1<CR>
nnoremap <silent> <M-k> :resize +1<CR>
nnoremap <silent> <M-h> :vertical resize +2<CR>
nnoremap <silent> <M-l> :vertical resize -2<CR>

"commands
command Config :e $MYVIMRC
command ReloadConfig :source $MYVIMRC
command! -nargs=1 Run :!<args>


function! ToggleSpellCheck()
    if &spell == 0
        set spell
    else
        set nospell
    endif
endfunction
command SpellCheckToggle call ToggleSpellCheck()

"colorscheme
colorscheme onedark
