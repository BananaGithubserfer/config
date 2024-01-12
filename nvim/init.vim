"""default options"""
:set foldmethod=indent
:set foldlevel=1000
:set rulerformat=%36(%F\ %)%=%l,\ %v
:set number "relativenumber
:set splitbelow
:set smartindent
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

"""plug plugins"""
call plug#begin()
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mfussenegger/nvim-dap'
Plug 'folke/tokyonight.nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mindriot101/vim-yapf'
Plug 'rhysd/vim-clang-format'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'kassio/neoterm'
Plug 'vim-autoformat/vim-autoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'gregsexton/MatchTag'
"Plug 'neoclide/coc-pairs'
"Plug 'windwp/nvim-autopairs'
"Plug 'gosukiwi/vim-smartpairs'
"Plug 'dracula/vim', { 'name': 'dracula' }
"Plug 'Wansmer/langmapper.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'cordx56/lexima.vim-coc.nvim'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'folke/tokyonight.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make'}


call plug#end()


"""startify"""
function! StartifyMapping()
    nmap <buffer> l <CR>
    "    nmap <buffer> / :Telescope find_files hidden=true <CR>
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


"""netrw"""
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_preview = 1
let g:netrw_list_hide = '^\./$,^\../$'
"let g:netrw_hide = 1
"let g:netrw_liststyle = 3

function! NetrwMapping()
    nmap <buffer> q :bd<cr>
    nmap <buffer> s :Startify<cr>
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> t %
    nmap <buffer> fr R
    nmap <buffer> m mf
    nmap <buffer> c mc
    " nmap <buffer> <Space> <cmd>:Telescope find_files hidden=true <CR>
    " nmap <buffer> ff <cmd>:Telescope find_files hidden=true <CR>
    " nmap <buffer> / <cmd>:Telescope find_files hidden=true <CR>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END


"""creation of c++ file"""
function! Forcpp()
    if empty(glob("%"))
        :-1read $HOME/.config/nvim/c.c
        normal! 4j
        normal! 4l
        :startinsert
    endif
endfunction

autocmd filetype c :call Forcpp()
autocmd filetype cpp :call Forcpp()


"""creation of html file"""
let g:matchup_matchparen_offscreen = {'method': 'popup'}

function! Forhtml()
    if empty(glob("%"))
        :-1read $HOME/.config/nvim/html.html
        normal! 5j
        normal! 9l
        :startinsert
        "<CR>"/{<CR>o
    endif
endfunction

autocmd filetype html :call Forhtml()


"""code formatting"""
nnoremap f :Autoformat<cr>
autocmd filetype python nmap <buffer> f :Yapf<cr>
let g:yapf_style = "pep8"
autocmd filetype c nmap <buffer> f :ClangFormat<cr>
autocmd filetype cpp nmap <buffer> f :ClangFormat<cr>
autocmd filetype html inoremap <buffer> <expr> <CR> InsertMapForEnter()
autocmd filetype html setlocal softtabstop=2
autocmd filetype html setlocal tabstop=2
autocmd filetype html setlocal shiftwidth=2

let g:clang_format#style_options = {
            \ "Standard" : "C++11",
            \ "MaxEmptyLinesToKeep" : 2}

"""launch code"""
let g:neoterm_autoinsert = 1
nnoremap <tab> :split<CR>:Ttoggle<cr>
autocmd filetype php nnoremap <buffer> <tab> :w<CR>:split<CR>: T php %:t <CR>
autocmd filetype python nnoremap <buffer> <tab> :w<CR>:split<CR>:T exec python3 -i %:t <cr> | redraw!
autocmd filetype sh nnoremap <buffer> <tab> :w<CR>:split<CR>: T bash %:t<CR>
autocmd filetype html nnoremap <buffer> <tab> :AsyncRun browser-sync start --server --no-online --no-notify --files . <CR><cr>
"autocmd filetype html nnoremap <buffer> <tab> :!xdg-open %<cr><cr>
"autocmd filetype c nnoremap <buffer> <tab> :w<CR>:split<CR>:T g++ %:t -o /tmp/a.aut && echo "##running##" && /tmp/a.aut<CR><cr>
"autocmd filetype cpp nnoremap <buffer> <tab> :w<CR>:split<CR>:T g++ %:t -o /tmp/a.aut && echo "##running##" && /tmp/a.aut<CR><cr>
"autocmd filetype cpp command Gdb call Gdb()
autocmd filetype cpp cnoremap gdb call Gdb()

function! Gdb()
    silent update
    split
    :T g++ %:t -g -o /tmp/a.aut && echo "##running##" && gdb -silent /tmp/a.aut
    let g:runned=1
endfunction

autocmd filetype c nnoremap <buffer> <tab> :call Runcpp()<cr>
autocmd filetype cpp nnoremap <buffer> <tab> :call Runcpp()<cr>
autocmd filetype c let g:runned=0
autocmd filetype cpp let g:runned=0
autocmd filetype c autocmd BufWritePost * let g:runned=0
autocmd filetype cpp autocmd BufWritePost * let g:runned=0

function! Runcpp()
    if &modified
        let g:runned=0
    endif

    if g:runned==0
        silent update
        split
        :T g++ %:t -o /tmp/a.aut && echo "##running##" && /tmp/a.aut
        let g:runned=1
    else
        split
        :T echo "##running##" && /tmp/a.aut
    endif
endfunction


"""code mappings"""
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction


"""coc-nvim"""
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""theme"""
":colorscheme dracula
":colorscheme tokyonight-night
":hi normal ctermbg=None
":hi MatchParen cterm=underline ctermfg=none


"""mappings"""
cnoremap rn execute "normal \<Plug>(coc-rename)"

autocmd filetype zip nnoremap <buffer> l <CR>
nnoremap <Enter> o<Esc>
nnoremap <S-Enter> O<Esc>
nnoremap <C-Space> @q
nnoremap <Space> :Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR><cr>
inoremap jj <esc>
inoremap оо <esc>
cnoremap jj <esc>
cnoremap оо <esc>
noremap ; $
noremap ж $
nnoremap <C-t> :-1read $HOME/.config/nvim/c.c<CR>/{<CR>o
"nnoremap \ :Telescope current_buffer_fuzzy_find<CR>
"nnoremap <C-l> <cr>
"inoremap <C-l> <cr>
"nnoremap sf <cmd>Telescope live_grep hidden=true <cr>

"""commands"""
cnoreabbrev git !git
command Wq wq!
command WQ wq!
command W w!
command Q q!
command Qa Qa!
"command C :w | :!cat ~/.config/nvim/c.c >> %
"cnoreabbrev git !git



lua << EOF
-- require("nvim-autopairs").setup {}

require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color

 custom_highlights = function(colors)
         return {
             normal = { bg = "#000000", fg = "#ffffff" },
             NormalFloat = { bg = colors.blue, fg = "#ffffff" },
             Pmenu = { bg = "#414240", fg = "#ffffff" },
             StatusLineNC = { bg = "#414240", fg = "#ffffff" },
         }
     end
})

vim.cmd[[colorscheme tokyonight]]

local function escape(str)
  -- Эти символы должны быть экранированы, если встречаются в langmap
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Наборы символов, введенных с зажатым шифтом
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
-- Наборы символов, введенных как есть
-- Здесь я не добавляю ',.' и 'бю', чтобы впоследствии не было рекурсивного вызова комманды
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
vim.opt.langmap = vim.fn.join({
                   --  ; - разделитель, который не нужно экранировать
                   --  |
  escape(ru_shift) .. ';' .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

EOF
