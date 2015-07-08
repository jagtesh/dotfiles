" Get Plug first, run the following command:
" (source: https://github.com/junegunn/vim-plug)
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Select your Leader key
let mapleader = "\,"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'jagtesh/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'maksimr/vim-jsbeautify'

" This is non minimal
Plug 'shougo/unite.vim'

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Enable tabline and make tweaks to vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:aurline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:aurline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 1

" Show the buffer number in vim-airline tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

" A little hack for vim pane resize support with mouse inside a tmux session
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Other NERDTree niceties
let g:NERDTreeWinSize = 32
" Force NERDTree to change CWD in VIM when the tree root changes
let g:NERDTreeChDirMode = 2
" Force CtrlP to consider the CWD in VIM
    

" Load other plugins
call plug#end()

" Define maps for your plugins
" nnoremap <Leader>o :CtrlP<CR>
noremap <F2> :NERDTreeToggle<CR>
noremap <Leader>[ :NERDTreeToggle<CR>
" Hide the highlighting when backspace is pressed
noremap <Backspace> :noh<CR>
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>
noremap <C-g> :bd<CR>


" Use jk/kj to quickly escape from insert mode
inoremap jk <Esc>
inoremap kj <Esc>
