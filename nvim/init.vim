let g:python3_host_prog = '~/dev/python/venv/bin/python3'
let g:loaded_python_provider = 0


call plug#begin('~/.vim/plugged')

" Theme
Plug 'drewtempelmeyer/palenight.vim'

"ALE Lint support
"Plug 'dense-analysis/ale'

Plug 'tpope/vim-sensible'
Plug 'jmcantrell/vim-virtualenv'

Plug 'rust-lang/rust.vim'
"Plug 'zchee/nvim-go', { 'do': 'make'}


Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion' "<<Investigate as changes navigation
"would also need map <Leader> <Plug>(easymotion-prefix)

Plug 'bling/vim-airline'

" https://breuer.dev/blog/top-neovim-plugins.html
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"Fuzzy FInder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"May delete
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

Plug 'preservim/nerdcommenter'


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

set background=dark
colorscheme palenight

"Turn off Swap FIle BS
set nobackup
set nowritebackup
set noswapfile

"set clipboard+=unnamedplus
"let g:virtualenv_directory = '~/dev/python/3_7/venv'

let NERDTreeShowHidden=1


set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>


"CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
"End CoC


"Fzf
map ; :Files<CR>

" Hack for window splitting - if you press ctrl + j and there is a window
" below your pane switch to it, otherwise create a new pane below and switch
" to it
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>


noremap <Leader>s :update<CR>

:set number relativenumber


"terminal escape
tnoremap <Esc> <C-\><C-n>

"set 79 char line
set colorcolumn=79

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>

let g:go_highlight_trailing_whitespace_error=0
