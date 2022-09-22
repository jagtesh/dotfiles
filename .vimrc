" Get Plug first, run the following command:
" (source: https://github.com/junegunn/vim-plug)
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible
set autoindent
set backspace=indent,eol,start

" Unify the clipboard between tmux, vim and OS
set clipboard=unnamed
set relativenumber
set laststatus=2

" Select your Leader key
let mapleader = ","
let g:mapleader = ","
let g:airline_powerline_fonts = 0

if !has('nvim')
  set encoding=utf-8
endif

set fileencodings=utf-8
set t_Co=256

" VimR niceties
if has("gui_vimr")
  set termguicolors
  set title
endif

" Simple fix for tabs in Makefile
autocmd FileType make setlocal noexpandtab

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary' 
Plug 'edkolev/tmuxline.vim'
" Plug 'Valloric/MatchTagAlways'
" Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'Shougo/neco-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'tomasr/molokai'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" YouCompleteMe
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-compiler' }
" Plug 'larrylv/ycm-elixir'

" Disabled plugs
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'Shougo/denite.vim'
" Plug 'zchee/deoplete-go', { 'do': 'make' }
" Plug 'tpope/vim-vinegar'
" Plug 'bling/vim-bufferline'
" Plug 'lyip1992/smyck-vim'
" Plug 'maksimr/vim-jsbeautify'

" MatchTagAlways options
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1
  \}


" Enable tabline and make tweaks to vim-airline
if g:airline_powerline_fonts == 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:aurline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:aurline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_detect_paste = 1
endif

" This forces nerdtree-git-plugin to use text icons
let g:NERDTreeUseSimpleIndicator = 1

" Force tmuxline to not use icons
let g:tmuxline_powerline_separators = 0

" Show the buffer number in vim-airline tabline
"let g:airline#extensions#tabline#buffer_nr_show = 1

" A little hack for vim pane resize support with mouse inside a tmux session
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Force NERDTree to change CWD in VIM when the tree root changes
let g:NERDTreeWinSize = 32
let g:NERDTreeChDirMode = 2
" Force CtrlP to consider the CWD in VIM
let g:ctrlp_working_path_mode = 0

" Turn on omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Initialize all plugins
" let g:elixir_autobuild = 1
" let g:elixir_showerror = 1
let g:elixir_maxpreviews = 20
let g:elixir_docpreview = 1
let g:deoplete#enable_at_startup = 1
let g:ctrlp_funky_syntax_highlight = 1

call plug#end()

" Setup folding defaults
set foldmethod=syntax
set nofoldenable
let g:polyglot_disabled = ['elixir', 'javascript']
" Enable JSX support in .js files
let g:jsx_ext_required = 0
"set foldlevelstart=20

" Set the theme and additional color customizations
" colo wombat256mod
set background=dark
" colorscheme PaperColor
colorscheme molokai
" Enabled Molokai tweaks for 256 colours
let g:rehash256 = 1
" Turn off the split border styling (certain themes look ugly with it)
set fillchars+=vert:\ 

" Define maps for your plugins
" nnoremap <Leader>o :CtrlP<CR>
noremap <F2> :NERDTreeToggle<cr>
noremap <Leader>[ :NERDTreeToggle<CR>

" Hide the highlighting when backspace is pressed
noremap <Backspace> :noh<CR>
noremap <C-g> :bd<CR>
noremap <Leader>w :w<CR>m
noremap <Leader>r :vertical resize 32<CR>
noremap <Leader>fd :NERDTreeFind<CR>
noremap <C-P> :CtrlPCurWD<CR>
nnoremap <Leader>fn :CtrlPFunky<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>tt <Ctrl-w><Ctrl-]><Ctrl-w>T<CR>
nnoremap <Leader>q :tabclose<CR>

" Use jk/kj to quickly escape from insert mode, space at end keeps character
" in same position
inoremap jk <Esc> " extra space at end
inoremap kj <Esc> " extra space at end
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
 
" Allow saving of files as sudo 
cmap w!! w !sudo tee > /dev/null %
set rtp+=/usr/local/opt/fzf
