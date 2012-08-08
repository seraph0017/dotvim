call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible

"" filetype plugin indent on
filetype off

"" full screen on statup
set fu
set fuopt=maxvert,maxhorz

set encoding=utf-8
set nu
set listchars=tab:>-,trail:~
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set list

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

set guifont=Monaco:h12
set guifontwide=Monaco:h12

set lines=56 columns=240
set autoindent

set cc=72,79
set ruler
set rnu
set undofile

syntax on
set hlsearch
set hidden

colorscheme wombat

set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
    set transp=5
endif

set incsearch

nmap wm :NERDTreeToggle<cr>

let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

nnoremap <silent> <F3> :Grep<CR>

" settings for tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30

" settings for gundo
nnoremap <silent> <F6> :GundoToggle<CR>

" Bubbing single line
"nmap <C-Up> ddkP
"nmap <C-Down> ddp
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubbing multiple lines
"vmap <C-UP> xkP`[V`]
"vmap <C-Down> xp`[V`]
vmap <C-UP> [egv
vmap <C-Down> ]egv

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabe $MYVIMRC<CR>

" Toggle spell checking on and off with `\s`
nmap <silent><leader>s :set spell!<CR>

"" Only do this part when compiled with support for autocommands
"if has("autocmd")
    "" Enable file type detection
    "filetype on

    "" Syntax of these languages is fussy over tabs Vs spaces
    "autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    "" Customisations based on house-style (arbitrary)
    "autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    "" Treat .rss files as XML
    "autocmd BufNewFile,BufRead *.rss setfiletype xml
"endif

function! <SID>StripTrailingWhitespacesAndDuplicateBlankLines()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    %s/^\n$//g
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespacesAndDuplicateBlankLines()<CR>

set cursorline
set cursorcolumn

let g:pyflakes_autostart = 0
map <F7> :PyflakesToggle<cr>
let g:pyflakes_use_quickfix = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'python': '\.pyc$\|\.ptlc$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
