:set number "relativenumber
:set splitbelow
:set noswapfile
:set nobackup
:set nowritebackup
:set autoindent 
:set smarttab
:set shiftwidth=4
:set expandtab
:set tabstop=4
:set softtabstop=4
:set scrolloff=7
:set laststatus=0
:set colorcolumn=79
:set mouse=a
:set clipboard=unnamedplus 
:set ignorecase
:set autochdir
:set nohlsearch
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;

call plug#begin()
    Plug 'ap/vim-css-color'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mhinz/vim-startify'
    Plug 'dracula/vim', { 'name': 'dracula' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make'}
    Plug 'kassio/neoterm'
    Plug 'tpope/vim-fugitive'
    Plug 'rhysd/vim-clang-format'
call plug#end()

"startify"
function! StartifyMapping()
  nmap <buffer> l <CR>
  nmap <buffer> / :Telescope find_files hidden=true <CR>
endfunction

augroup startify_mapping
  autocmd!
  autocmd filetype startify call StartifyMapping()
augroup END

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [
        \ { 'a': '~/.config/alacritty/alacritty.yml' },
        \ { 'n': '~/.config/nvim/init.vim' },
        \ { 's': '~/.config/sway/config' },
        \ { 'p': '~/projects/' },
        \ { 'c': '~/.config/' },
        \ { 'b': '~/.bashrc' },
        \ ]
"netrw"
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_preview = 1
let g:netrw_list_hide = '^\./$,^\../$'
"let g:netrw_hide = 1
"let g:netrw_liststyle = 3

function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> rm -r<CR>
    normal mu
    normal mf
    
    try
      normal mx
    catch
      echo "Canceled"
    endtry

    cunmap <buffer> <CR>
  endif
endfunction

function! NetrwMapping()
  nmap <buffer> <Space> <cmd>:Telescope find_files hidden=true <CR>
  nmap <buffer> ff <cmd>:Telescope find_files hidden=true <CR>
  nmap <buffer> / <cmd>:Telescope find_files hidden=true <CR>
  nmap <buffer> s :Startify<cr>
  nmap <buffer> fd :call NetrwRemoveRecursive()<CR>
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> t %
  nmap <buffer> fr R
  nmap <buffer> m mf
  nmap <buffer> c mc

endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

"for c++
function! Forc()
"    if !echo % == ""
"        echo "forc"
"        :-1read $HOME/.config/nvim/c.c<CR>
"    endif

if empty(glob("%"))
    :-1read $HOME/.config/nvim/c.c
    normal! 4j
    normal! a     
    :startinsert 
    "<CR>"/{<CR>o
endif
endfunction

autocmd BufEnter *.c :call Forc()


"run code
nnoremap <tab> :split<CR>:Ttoggle<cr>

autocmd Filetype php nnoremap <buffer> <tab> :w<CR>:split<CR>: T php % <CR>
autocmd Filetype python nnoremap <buffer> <tab> :w<CR>:split<CR>: T exec python3 -i %<CR>
autocmd Filetype c nnoremap <buffer> <tab> :w<CR>:split<CR>: T g++ % -o /tmp/a.aut && /tmp/a.aut<CR>
let g:neoterm_autoinsert = 1

"coc-nvim

  function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ CheckBackSpace() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


"telescope
lua require('telescope').load_extension('fzf')

"theme
:colorscheme dracula
:hi normal ctermbg=None

"mappings
nnoremap f :ClangFormat<cr>
"nnoremap tl gt
"nnoremap th gT
"nnoremap tt :tabnew<CR>
"nnoremap tc :tabclose<CR>
nnoremap <Enter> o<Esc>
nnoremap <C-Space> @q
"nnoremap / <cmd> :Telescope current_buffer_fuzzy_find<cr>
nnoremap sf <cmd>Telescope live_grep hidden=true <cr>
"nnoremap <Space> :Ntree<CR>
nnoremap <Space> :Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>
inoremap jj <esc>
inoremap оо <esc>
cnoremap jj <esc>
cnoremap оо <esc>
nnoremap d "0d
vnoremap d "0d
nnoremap в "0d
nnoremap <C-l> <cr>
inoremap <C-l> <cr>
vnoremap в "0d
noremap ; $
noremap ж $
nnoremap <C-t> :-1read $HOME/.config/nvim/c.c<CR>/{<CR>o
nnoremap \ :Telescope current_buffer_fuzzy_find<CR>

"commands
cnoreabbrev git !git
"command C :w | :!cat ~/.config/nvim/c.c >> %
"cnoreabbrev git !git
command Wq wq!
command WQ wq!
command W w!
command Q q!
command Qa Qa!
