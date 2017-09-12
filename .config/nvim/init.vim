set number
set showcmd
set showmode
set ruler
set showmatch
set textwidth=0
set noerrorbells
set nojoinspaces
set mouse=r
set relativenumber
set background=dark
 
let g:python_host_prog = '/home/jim/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/jim/.pyenv/versions/neovim3/bin/python'
 
call plug#begin()
 
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'neomake/neomake'
" 
call plug#end()
" 
let g:mapleader = '\<Space>'
colorscheme gruvbox 
" 
" " My autocmds
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd FileType go setlocal tabstop=8 shiftwidth=8 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
" 
" " Deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd CompleteDone * pclose!
" 
" Deoplete go
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" 
" " NeoMake
" autocmd! BufWritePost * Neomake
" 
" vim-go
map <Leader>r :GoRun<CR>
map <Leader>d :GoDoc<CR>
" 
" " NerdTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info$']
let NERDTreeShowHidden=1
" 
" " CtrlP
let g:ctrlp_show_hidden = 1
" 
" " Airline
let g:airline_powerline_fonts = 1
