set number
set ruler
set showmatch
set textwidth=0
set noerrorbells
set nojoinspaces
set mouse=a
set background=dark

let g:python_host_prog = "/home/dimdal/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/home/dimdal/.pyenv/versions/neovim3/bin/python3"
let g:mapleader = ' ' 
call plug#begin()
" General
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'

" Files and dirs
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'

call plug#end()

" Theme
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Python
autocmd FileType python set colorcolumn=80

" FZF
command! -bang -nargs=* Rgp
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --type py '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* Rgj
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --type js '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>sp :Rgp<CR>
nnoremap <leader>sj :Rgj<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NerdTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info$', '\.idea', '\.python-version', '\.git']
let NERDTreeShowHidden=1

" Echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1

" Neosnippet
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/dimdal/.pyenv/shims/pyls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
