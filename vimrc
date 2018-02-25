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

set nocompatible
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/binding/vim/'}
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'dracula/vim' "Theme
Plugin 'altercation/vim-colors-solarized' "Theme
Plugin 'joshdick/onedark.vim' "Theme
Plugin 'Tagbar'
Plugin 'L9'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'WolfgangMehner/awk-support'
Plugin 'WolfgangMehner/bash-support'
Plugin 'haskell.vim' "Haskell language
Plugin 'leafgarland/typescript-vim' "typescript高亮
Plugin 'pangloss/vim-javascript' "javascript高亮
Plugin 'mxw/vim-jsx' "react高亮
Plugin 'tpope/vim-rails' "rails.vim
Plugin 'luochen1990/rainbow' "彩虹括号
Plugin 'ternjs/tern_for_vim' "JS结构预览
Plugin 'eagletmt/ghcmod-vim' "ghc-mod
Plugin 'bitc/lushtags' "haskell结构预览
Plugin 'npm.vim' "npm commands
Plugin 'tpope/vim-obsession' "vim session store
Plugin 'Yggdroot/indentLine' "Python Indent Line
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'minibufexplorer'
call vundle#end()
filetype plugin indent on

" NERDTree CONFIG
map <C-\> :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeWinPos="right"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.git$', '\.pyc$', '\~$', 'node_modules', '\.swp$']
let NERDTreeMinimalUI=1

" Powerline CONFIG
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Set background according to system time
if strftime('%H') >= 21 || strftime('%H') <= 9
        set background=dark
else
        set background=light
endif

" Set Cursor Model
if !has('gui_running')
        set t_Co=256
        if has('termguicolors')
                set termguicolors
        end
        colorscheme dracula
        let lightlineColor='Dracula'
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_SR = "\<Esc>]50;CursorShape=2\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        set timeoutlen=1000 ttimeoutlen=0
else
        if strftime('%H') >= 21 || strftime('%H') <= 9
                set background=dark
        else
                set background=light
        endif
        colorscheme solarized
        call togglebg#map("<F2>")
        let lightlineColor='solarized'
endif

" Conifg latex-preview
let g:livepreview_previewer='open -a Skim'
let g:livepreview_engine='xelatex'

" Conifg syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
" Use pylint to check python files.
" let g:syntastic_python_checkers = ['pylint']
map <C-p> :SyntasticToggleMode<CR> :SyntasticCheck<CR>
" Ignore warnings about newlines trailing.
let g:syntastic_quiet_messages = { 'regex': ['trailing-newlines', 'invalid-name',
    \'too-many-lines', 'too-many-instance-attributes', 'too-many-public-methods',
    \'too-many-locals', 'too-many-branches'] }

" Config for airline
let g:airline_section_b='%{strftime("%c")}'
let g:airline_section_y='BN: %{bufnr("%")}'

" Conifg for markdown preview
let g:instant_markdown_slow = 1

" Config IndentLine
let g:indentline_char = "|"
let g:indentline_enabled = 1
let g:autopep8_disable_show_diff = 1

" Config ctrlp.vim
map <F3> :CtrlP<CR>

" Config tagbar
map <F2> :TagbarToggle<CR>

" Config YCM
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
