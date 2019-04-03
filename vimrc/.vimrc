"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoBundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Better file browse"r
NeoBundle 'scrooloose/nerdtree'
" Code commenter
NeoBundle 'scrooloose/nerdcommenter'
" Class/module browser
NeoBundle 'majutsushi/tagbar'
" Indent text object
NeoBundle 'michaeljsmith/vim-indent-object'

" Search results counter
NeoBundle 'IndexedSearch'
" XML/HTML tags navigation
NeoBundle 'matchit.zip'
" Gvim colorscheme
NeoBundle 'Wombat'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'flazz/vim-colorschemes'
" Bash support
NeoBundle 'bash-support.vim'
" Markdown
" NeoBundle 'instant-markdown.vim'
" NeoBundle 'Markdown'
" C and C++ stuff
NeoBundle 'Brace-Complete-for-CCpp'
NeoBundle 'cpp.vim'
"NeoBundle 'c.vim'
" Ruby stuff
NeoBundle 'ruby.vim'
" Git integration
NeoBundle 'fugitive.vim'
" NeoBundle 'motemen/git-vim'
" Tab list panel
NeoBundle 'kien/tabman.vim'
" Syntax check
NeoBundle 'scrooloose/syntastic'
" Autocompletion
NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'vim-airline/vim-airline'

NeoBundle 'Shougo/unite.vim'
" Ctrl-P for quick fuzzy file opening
NeoBundle "kien/ctrlp.vim"

" AnsiEsc (interpret ANSI color escape sequences)
NeoBundle 'vim-scripts/AnsiEsc.vim' 

" Switch between cpp and h files
NeoBundle 'derekwyatt/vim-fswitch' 

" Better JSON support
NeoBundle 'elzr/vim-json' 

" Fast fold for faster reading of large files
NeoBundle 'Konfekt/FastFold' 

" Scroll through colorschemes with :SCROLL
" NeoBundle 'vim-scripts/ScrollColors'

" Tmux integration
NeoBundle "benmills/vimux"

NeoBundle "vim-scripts/a.vim"
NeoBundle "pangloss/vim-javascript"
NeoBundle "lervag/vim-latex"
NeoBundle "vim-scripts/DoxygenToolkit.vim"
NeoBundle "editorconfig/editorconfig-vim"

" NeoBundle "fatih/vim-go"

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled NeoBundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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
let mapleader = "<"
let g:mapleader = "<"

" Fast saving
nmap <leader>w :w!<cr>

" Not compatible with vi
set nocompatible
" save as sudo
ca w!! w !sudo tee "%"

" Enable mouse support in vim
set mouse=a

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7
set ruler "Always show current position

set showcmd
set showmode

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
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.out,.toc

set shortmess=aTI
" Fast terminal
set ttyfast

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Let vim share clipboard
set clipboard=unnamedplus


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
 set background=dark
"colorscheme solarized
 colorscheme ir_black
 let g:solarized_termcolors=256
endif

" Make sure we don't put byte order marks in files
set nobomb
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

" Tabs and indenting
set tabstop=4
set shiftwidth=2
set softtabstop=4
set smarttab

set lbr
set tw=500

set autoindent "Auto indent
set wrap "Wrap lines
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close preview window after completion
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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

function! SetWtCppFileType()
    if &syntax ==? ""
        set syntax=cpp
        set filetype=cpp
    endif
endfunction

autocmd! BufRead,BufNewFile,BufEnter,BufWinEnter,FileReadPost */src/Wt/* call SetWtCppFileType()

""""""""""""""""""""""""""""""
" => Ruby Section
""""""""""""""""""""""""""""""
"Now using ruby plugin
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


""""""""""""""""""""""""""""""
" => YAML Section
""""""""""""""""""""""""""""""
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

""""""""""""""""""""""""""""
" => Synstatic
" """"""""""""""""""""""""""

let g:syntastic_cpp_include_dirs = ['../include','include', '/home/benoit/projects/wt/install/include/, /opt/software/boost/boost_1_55_0/include']
let g:syntastic_cpp_check_header = 1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 0 
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -Werror=return-type'

"""""""""""""""""""""""""""
" => Vimux
"""""""""""""""""""""""""""
let g:VimuxHeight = "15"
map <Leader>t :VimuxTogglePane<CR>
map <Leader>c :VimuxPromptCommand<CR>
