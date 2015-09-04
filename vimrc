" Highlighted search
set encoding=utf-8
set hlsearch
set noswapfile

" Displays line numbers
set number

" My colorscheme
colorscheme railscasts

" Syntax for any language available activated
syntax on

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac
set guioptions-=T
set guifont=Inconsolata\ for\ Powerline\ Medium\ 10

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
filetype plugin on

" Indentation settings
filetype indent on
set smartindent

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=2


" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line"


" Web development specifics
"
" for CSS, also have things in braces indented:
autocmd FileType css set smartindent
" for HTML, generally format text, but if a long line has been created
" leave it alone when editing:
autocmd FileType html set formatoptions+=tl
" for both CSS and HTML, use genuine tab characters for
" indentation, to make files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2
" for embedded ruby
autocmd FileType eruby set ft=eruby.html

" Set directory to the one of the opened file
set autochdir

" Set copy and paste shortcuts

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Set omnicompletion for python
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location = '~/.vim/after/ftplugin/complete-dict'

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Powersymbols
let g:airline_powerline_fonts = 1

" Relative numbers
nnoremap <F3> :NumbersToggle<CR>

" Load custom plugins with pathogen
call pathogen#infect()

" Ruby core C style
au FileType c setl ts=8 sw=4 noexpandtab

" Java style
au FileType java setl sw=4 si noexpandtab

" Lyx
autocmd BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
autocmd BufRead *.lyx syntax sync fromstart

" RABL
au BufRead,BufNewFile *.rabl setf ruby

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Promptline
let g:promptline_preset = {
        \'a' : [ promptline#slices#user() ],
        \'b' : [ promptline#slices#host() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'airline'

" Fix tmux arrows in insert mode
map <ESC>oA <ESC>ki

" Move between tabs with Alt j and Alt k
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Limit to 80 columns
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

" Configure vim-flay
let g:flay_on_open=0
let g:flay_piet_text="✗"
