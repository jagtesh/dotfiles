" Get Plug first, run the following command:
" (source: https://github.com/junegunn/vim-plug)
"
" For vim:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Other dependencies:
" fuzzy matching: fzf, bat, fd
" auto-complete : kite
" file searching: the-silver-searcher
 
" ### PLUGIN SETTINGS ###
" [polyglot]
let g:polyglot_disabled = ['elixir', 'javascript']

" automated plug installation on neovim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" ===========================
"    PLUGIN + CONFIGURATION
" ===========================
call plug#begin()

Plug 'sheerun/vimrc'
" Overwrite this change from sheerun/vimrc
" Prevents resize of window if it is less than 79 cols which is annoying
set winwidth=40 " change min-width to 40 cols

Plug 'bling/vim-airline'
" Show the buffer number in vim-airline tabline
"let g:airline#extensions#tabline#buffer_nr_show = 1
" Enable tabline and make tweaks to vim-airline
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
if g:airline_powerline_fonts == 0 " turns off fancy styles for powerline if enabled
  let g:airline#extensions#tabline#left_sep = ''
  let g:aurline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:aurline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endif

Plug 'scrooloose/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
" This forces nerdtree-git-plugin to use text icons
let g:NERDTreeUseSimpleIndicator = 0
" This forces nerdtree-git-plugin to use text icons
let g:NERDTreeUseSimpleIndicator = 0
" Force NERDTree to change CWD in VIM when the tree root changes
let g:NERDTreeWinSize = 32
let g:NERDTreeChDirMode = 2

" # All things CtrlP and Ag (fzf replaces both plugins)
" Plug 'kien/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
" " Force CtrlP to consider the CWD in VIM
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_funky_syntax_highlight = 1
" " Ignore some folders and files for CtrlP indexing
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
"   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
"   \ }
" Plug 'rking/ag.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary' 
Plug 'edkolev/tmuxline.vim'
" Force tmuxline to not use icons
let g:tmuxline_powerline_separators = 1

Plug 'christoomey/vim-tmux-navigator'
Plug 'thinca/vim-ref'
Plug 'Shougo/neco-vim'
Plug 'pangloss/vim-javascript'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
Plug 'codota/tabnine-vim'
" Plug 'beeender/Comrade'
Plug 'dense-analysis/ale'
" Plug 'Valloric/MatchTagAlways'
" MatchTagAlways options
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'javascript.jsx' : 1
  \}


" Install fzf before turning this on
" brew install fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'elixir-lang/vim-elixir'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" let g:elixir_autobuild = 1
" let g:elixir_showerror = 1
" let g:elixir_maxpreviews = 20
" let g:elixir_docpreview = 1
"
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tpope/vim-fugitive'
" YouCompleteMe
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-compiler' }
" Plug 'larrylv/ycm-elixir'

" Disabled plugs
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'Shougo/denite.vim'
" let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-go', { 'do': 'make' }
" Plug 'tpope/vim-vinegar'
" Plug 'bling/vim-bufferline'
" Plug 'lyip1992/smyck-vim'
" Plug 'maksimr/vim-jsbeautify'


call plug#end()

" ===========================
"          DEFAULTS
" ===========================
" A little hack for vim pane resize support with mouse inside a tmux session
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" ### DEFAULTS ###
" Some may already be covered by plugs above
set nocompatible
set autoindent
set smartindent
set backspace=indent,eol,start

" Unify the clipboard between tmux, vim and OS
set clipboard=unnamed

" Update gutter configuration
" use:
"   relativenumber to turn on relative numbers
"   norelativenumber to turn off relative numbers
set norelativenumber
set laststatus=2

" Select your Leader key
let mapleader = ","
let g:mapleader = ","

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

" Setup folding defaults
set foldmethod=syntax
set nofoldenable

" Enable JSX support in .js files
let g:jsx_ext_required = 0
"set foldlevelstart=20

" [colorscheme]
" Set the theme and additional color customizations
" colo wombat256mod
set background=dark
" colorscheme PaperColor
colorscheme molokai
" Enabled Molokai tweaks for 256 colours
let g:rehash256 = 1
" Turn off the split border styling (certain themes look ugly with it)
set fillchars+=vert:\ 

" [kite]
let g:kite_supported_languages = ['python', 'javascript', 'go']
let g:kite_tab_complete=1


" ===========================
"           KEYMAPS
" ===========================

" Use jk/kj to quickly escape from insert mode, space at end keeps character
" in same position
inoremap jk <Esc> " extra space at end
inoremap kj <Esc> " extra space at end
" These may have made sense some time ago, now seem confusing :-/
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>

" [ctrlp]
" nnoremap <Leader>fn :CtrlPFunky<CR>
" nnoremap <Leader>fb :CtrlPBuffer<CR>
" noremap <C-P> :CtrlPCurWD<CR>

" [nerdtree]
" Define maps for your plugins
" nnoremap <Leader>o :CtrlP<CR>
noremap <F2> :NERDTreeToggle<cr>
" Open NERDTree in current buffer's folder
noremap <Leader>[ :NERDTreeToggle<CR>
" Open NERDTree in PWD
noremap <Leader>] :NERDTreeToggle %<CR>
noremap <Leader>f :NERDTreeFind<CR>

" [fzf/fuzzy matching]
" create a new fancy Files command with preview
command! -bang -nargs=? -complete=dir RFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
noremap <C-P>d <Esc><Esc>:RFiles %:p:h<CR>
noremap <C-P>p <Esc><Esc>:Files<CR>
noremap <C-P>b <Esc><Esc>:BLines<CR>
noremap <C-P>g <Esc><Esc>:BCommits!<CR>
" search in the directory of the open file

" [misc]
" Hide the highlighting when backspace is pressed
noremap <Backspace> :noh<CR>
" noremap <C-g> :bd<CR>
" noremap <Leader>w :w<CR>m
noremap <Leader>nr :NERDTreeFocus <bar> vertical resize 32<CR>
" nnoremap <Leader>tt <Ctrl-w><Ctrl-]><Ctrl-w>T<CR>
nnoremap <Leader>q :tabclose<CR>
nnoremap gb :bnext<CR>
nnoremap Gb :bprevious<CR>

" Terminal shortcuts
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" Allow saving of files as sudo 
cmap w!! w !sudo tee > /dev/null %

" Reload nvim source and call PlugInstall!
noremap <Leader>si :source $MYVIMRC <bar> PlugInstall!<CR>
noremap <Leader>sr :source $MYVIMRC<CR>
noremap <Leader>se :tabe $MYVIMRC<CR>
