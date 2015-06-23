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

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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


" Use jk/kj to quickly escape from insert mode
inoremap jk <Esc>
inoremap kj <Esc>
