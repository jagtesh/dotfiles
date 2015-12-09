" Get Plug first, run the following command:
" (source: https://github.com/junegunn/vim-plug)
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible
set autoindent
set backspace=indent,eol,start

" Select your Leader key
let mapleader = ","
let g:mapleader = ","
let g:airline_powerline_fonts = 1
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'jagtesh/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
"Plug 'jagtesh/nerdtree' "supports arrow glyphs in a wider range of fonts
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'maksimr/vim-jsbeautify'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-bufferline'
"Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'lyip1992/smyck-vim'

" This is non minimal
"Plug 'shougo/unite.vim'
Plug 'edkolev/tmuxline.vim'

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
" Force CtrlP to consider the CWD in VIM
let g:NERDTreeChDirMode = 2
" Supposedly super fast Ctrl P that uses git
"unlet g:ctrlp_custom_ignore
"let g:ctrlp_user_command = 'find %s -type f'
"unlet g:ctrlp_user_command
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'find %s -type f']


" Load other plugins
call plug#end()



colo smyck

" A few GUI options here
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata-dz\ for\ Powerline\ 14
  endif
endif

" Define maps for your plugins
" nnoremap <Leader>o :CtrlP<CR>
noremap <F2> :NERDTreeToggle<cr>
noremap <Leader>[ :NERDTreeToggle<CR>
" Hide the highlighting when backspace is pressed
noremap <Backspace> :noh<CR>
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>
noremap <C-g> :bd<CR>
noremap <Leader>w :w<CR>
noremap <Leader>r :vertical resize 32<CR>
noremap zz :wq<CR>


" Use jk/kj to quickly escape from insert mode
inoremap jk <Esc>l
inoremap kj <Esc>l
