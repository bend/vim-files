"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Better file browse"r
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Bash support
Bundle 'bash-support.vim'
" Markdown
" Bundle 'instant-markdown.vim'
" Bundle 'Markdown'
" C and C++ stuff
Bundle 'Brace-Complete-for-CCpp'
Bundle 'cpp.vim'
Bundle 'c.vim'
" Ruby stuff
Bundle 'ruby.vim'
" Git integration
Bundle 'fugitive.vim'
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Syntax check
Bundle 'scrooloose/syntastic'
" Autocompletion
Bundle 'Valloric/YouCompleteMe'
" Scala
Bundle 'derekwyatt/vim-scala'
Bundle 'scala.vim'


Bundle 'vundle'

Bundle 'Erlang-plugin-package'

Bundle 'Lokaltog/vim-powerline'

" Disabled
" Autocompletion
"Bundle 'AutoComplPop'
"Bundle 'neocomplcache'
"Bundle 'clang-complete'

" SuperTab
"Bundle 'ervandew/supertab'
"Bundle 'OmniCppComplete'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100
set title

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Not compatible with vi
set nocompatible
" save as sudo
ca w!! w !sudo tee "%"

" Enable mouse support in vim
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7
set ruler "Always show current position

set wildmenu
" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" Fast terminal
set ttyfast

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Let vim share clipboard
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
set guifont=Menlo:h14
set shell=/bin/zsh

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
  set guifont=Liberation\ Mono\ 10
else
  set t_Co=256
 "colorscheme zellner
 colorscheme ir_black
 set background=dark
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"improve autocomplete menu color
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set statusline=[%{HasPaste()}]\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [Line=%l:%c/%L]\ [CWD=%r%{CurDir()}%h]\ [%{fugitive#statusline()}]


function! CurDir()
    let curdir = substitute(getcwd(), "/home/ben/", "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    else
        return ''
    endif
endfunction

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set autoindent "Auto indent
set smartindent "Smart indent
set cindent
set wrap "Wrap lines
set showmatch
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close preview window after completion
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
"
"""""""""""""""""""""""""""""""
"" => Python section
"""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"" python/supertab
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview


au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => CPP Section
""""""""""""""""""""""""""""""
" configure tags - add additional tags here or comment out not-used ones
set nocp
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
""" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0
"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
set completeopt=menuone,menu,longest,preview

""""""""""""""""""""""""""""""
" => Ruby Section
""""""""""""""""""""""""""""""
"Now using ruby plugin
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/usr/bin/grep\ -nH

""""""""""""""""""""""""""""""
" => Remaps
""""""""""""""""""""""""""""""
" Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_
    map <C-K> <C-W>k<C-W>_

"""""""""""""""""""""""""""""""
"" => SuperTab
"""""""""""""""""""""""""""""""
""let g:SuperTabDefaultCompletionType="context"
""let g:SuperTabLongestHighlight=1
"""let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"
""au filetype html let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"
""au filetype css let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"
"
""""""""""""""""""""""""""""""
" => Plugin conf
""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_left = 1
let b:keymap_name = "acc"
if (&tildeop)
	nmap gcw guw~l
	nmap gcW guW~l
	nmap gciw guiw~l
	nmap gciW guiW~l
	nmap gcis guis~l
	nmap gc$ gu$~l
	nmap gcgc guu~l
	nmap gcc guu~l
	vmap gc gu~l
else
	nmap gcw guw~h
	nmap gcW guW~h
	nmap gciw guiw~h
	nmap gciW guiW~h
	nmap gcis guis~h
	nmap gc$ gu$~h
	nmap gcgc guu~h
	nmap gcc guu~h
	vmap gc gu~h
endif

set number
set encoding=utf-8

"""""""""""""""""""""""""""""
" => Cursor Conf
"""""""""""""""""""""""""""""
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;red\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;grey\x7"
  silent !echo -ne "\033]12;grey\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" Hide the default mode text
set noshowmode
