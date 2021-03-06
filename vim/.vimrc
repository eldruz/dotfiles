" ==========================================================
" VUNDLE
" ==========================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PlugIns List
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'           " need to be compiled to work
Plugin 'klen/python-mode'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
" Plugin 'TaskList'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Shougo/vimproc.vim'               " compilation needed
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==========================================================
" VIM CONFIGURATION
" ==========================================================
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc
set hidden                            " Hide buffers instead of closing them
set laststatus=2                      " Always show the statusline
set encoding=utf-8                    " Necessary to show Unicode glyphs
set t_Co=256
set mouse=a                           " Mouse support
" Options diverses pour l'affichage
syntax enable
set background=dark
set nu
syntax on
set autoindent
" Gestion de la taille des tabs
set tabstop=2
set shiftwidth=2
set expandtab
" Search text utilities
set incsearch
set ignorecase
set smartcase
set hlsearch
" Wildmenu
if has("wildmenu")
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
endif

" ==========================================================
" REMAPS
" ==========================================================
" Keeping <Esc> in the home row
inoremap jk <Esc>
" Remmaping the leader key
let mapleader = ","
" Ctrl-i clears the highlight from the last search
noremap <C-i> :nohlsearch<CR>
" Comportement des touches de navigation j et k
nmap j gj
nmap k gk
" Command line remaps
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
" Switch to previous buffer
nmap <C-e> :e#<CR>
" Switch between buffers
nmap <C-n> :bnext!<CR>
nmap <C-p> :bprev!<CR>
" Switch between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" Vim-unimpaired remaps
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" ==========================================================
" GUI OPTIONS
" ==========================================================
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Meslo\ LG\ S\ for\ Powerline\ 12

" ==========================================================
" COLOR-SCHEME
" ==========================================================
" colorscheme solarized

" ==========================================================
" VIM-AIRLINE
" ==========================================================
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#tabline#left_sep = ''
" Symbols configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" ==========================================================
" CTRLP
" ==========================================================
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>B :CtrlP<CR>
nmap <Leader>t :CtrlPTag<CR>
nmap <Leader>m :CtrlPMixed<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_regexp = 0
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15,results:10'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_show_hidden = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['tag', 'mixed']

" ==========================================================
" NERDTREE
" ==========================================================
nmap <Leader>e :NERDTreeToggle<CR>
" Start NerdTree if no files were specified on open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ==========================================================
" SYNTASTIC
" ==========================================================
" Haskell -- uses ghcmod
let g:syntastic_haskell_checkers = ['ghc_mod']
" Python -- uses pyflakes
" let g:syntastic_python_checkers=['pylint']
" HTML -- w3 validator
" let g:syntastic_html_checker=['w3']

" closetag options
" let g:closetag_html_style=1

" ==========================================================
" ULTISNIP
" ==========================================================
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit="vertical"
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-TAB>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-TAB>"
" Allow UltiSnip and YouCompleteMe to play nicely together
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" RUBY
" ==========================================================

" ==========================================================
" HASKELL
" ==========================================================
:filetype plugin on
" :nmap <C-K> :GhcModType<CR>
" :nmap <C-L> :GhcModTypeClear<CR>

" ==========================================================
" PYMODE
" ==========================================================
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_run = 0
let g:pymode_folding = 1
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_breakpoint = 0

" ==========================================================
" YOUCOMPLETEME
" ==========================================================
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_complete_in_comments = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_autoclose_preview_window_after_completion = 1

" ==========================================================
" EASYALIGN
" ==========================================================
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
let g:easy_align_delimiters = {
      \ 'd': { 
      \     'pattern': '"',
      \     'ignore_groups': ['String'],
      \     'ignore_unmatched': 0
      \  }
      \ }

" ==========================================================
" TASKLIST
" ==========================================================
map <leader>td <Plug>TaskList

" ==========================================================
" MISC
" ==========================================================
" haskellmode-vim
au BufEnter *.hs compiler ghc
:let g:haddock_browser="/usr/bin/firefox"

" TAGBAR
" nmap <F8> :TagbarToggle<CR>

