source ~/.config/nvim/plugins.vim
:if !empty(glob("~/.config/nvim/local.vim"))
:  source ~/.config/nvim/local.vim
:endif

" Appearance
" set termguicolors
"colorscheme NeoSolarized
let g:airline_theme='onedark'
let g:solarized_termcolors=256
set background=dark
colorscheme onedark


" Settings
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
set tabstop=4 shiftwidth=2 expandtab
set number
set relativenumber
set showcmd
set autoread

" Some shortcuts
let mapleader = " "
nnoremap <Leader>q :q<CR>
nnoremap tt :tabnew<CR>
imap <C-e> <C-y>, 
nnoremap <Leader>w :w<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
nmap <silent> <Leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <Leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" FZF
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <Leader>t :GFiles<cr>
else
    " otherwise, use :FZF
    nmap <silent> <Leader>t :FZF<cr>
endif

nmap <silent> <Leader>b :Buffers<cr>
nmap <silent> <Leader>p :FZF<cr>
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})


" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

" Syntax and lint
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_typescript_tsc_maker = {
    \ 'args': ['-m', 'commonjs', '--noEmit' ],
    \ 'append_file': 0,
    \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
\ }

let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E266'], }
let g:neomake_python_pycodestyle_maker = { 'args': ['--max-line-length=100', '--ignore=E266'], }

" Run Neomake on save
autocmd BufWritePost,BufEnter * Neomake

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <leader>h : <C-u>echo tsuquyomi#hint()<cr>

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0

" save as sudo
ca w!! w +!sudo tee "%"

" ctrl + s save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" navigate windows with arrows
map <Right> <c-w>l
map <Left> <c-w>h
map <Up> <c-w>k
map <Right> <c-w>l
map <Down> <c-w>j

" enable system clipboard for, er, system clipboard registers
" https://github.com/neovim/neovim/issues/583#issuecomment-272350992
set mouse=a

:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
:set list

nnoremap <C-k> gt
nnoremap <C-j> gT
