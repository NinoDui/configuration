set nocompatible
syntax on

set nu

set tabstop=4
set softtabstop=4
set expandtab

set autoindent
set smartindent
set ruler
set ignorecase
set smartcase

set laststatus=2
set backspace=2
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set showcmd

set showmatch
set incsearch
set hlsearch

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jpalardy/vim-slime'
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'WolfgangMehner/awk-support'
Plug 'WolfgangMehner/bash-support'
" C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-obsession'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin indent on

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeWinPos="right"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.git$', '\.pyc$', '\~$', 'node_modules', '\.swp$']
let NERDTreeMinimalUI=1

" Appearance
set t_Co=256
if has('termguicolors')
    set termguicolors
endif

if !has('gui_running')
    colorscheme dracula
    set timeoutlen=1000 ttimeoutlen=0
else
    if strftime('%H') >= 21 || strftime('%H') < 9
        set background=dark
    else
        set background=light
    endif
    colorscheme solarized
    call togglebg#map("<F5>")
endif

" Latex preview
let g:livepreview_engine='xelatex'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { 'regex': ['trailing-newlines', 'invalid-name',
    \'too-many-lines', 'too-many-instance-attributes', 'too-many-public-methods',
    \'too-many-locals', 'too-many-branches'] }
map <C-p> :SyntasticToggleMode<CR> :SyntasticCheck<CR>

" Airline
let g:airline_section_b='%{strftime("%c")}'
let g:airline_section_y='BN: %{bufnr("%")}'

" Markdown preview
let g:instant_markdown_slow = 1

" IndentLine
let g:indentline_char = "|"
let g:indentline_enabled = 1

" CtrlP
map <F3> :CtrlP<CR>

" Tagbar
map <F2> :TagbarToggle<CR>

" coc.nvim
set completeopt=longest,menuone,noinsert,noselect
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocActionAsync('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)

" C++ clang-format
let g:clang_format#style_options = {
    \ 'BasedOnStyle': 'Google',
    \ 'IndentWidth': 4,
    \ 'ColumnLimit': 100}
autocmd FileType c,cpp map <buffer> <C-k> :ClangFormat<CR>
autocmd FileType c,cpp set colorcolumn=100

" Python autopep8
let g:autopep8_max_line_length=100
let g:autopep8_on_save=0
autocmd FileType python map <buffer> <C-k> :Autopep8<CR>
autocmd FileType python set colorcolumn=100

" Julia
let g:latex_to_unicode_tab = 1
let g:latex_to_unicode_auto = 0
