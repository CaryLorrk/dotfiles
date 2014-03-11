"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Many plugins work with python >= 2.6
" Check if vim is compiled with python and you have python installed
" :echo has("python")

" Vim plugin management
Bundle 'gmarik/vundle' 

" Autocomplete engine
Bundle 'Valloric/YouCompleteMe' 
" YouCompleteMe needs some prerequisites.
" http://valloric.github.io/YouCompleteMe
" if jedi is not founded, run 'git submodule update --init --recursive' at YCM

" Autocomplete
" Bundle 'Shougo/neocomplcache.vim'

" Fuzzy File Finder
Bundle 'kien/ctrlp.vim'

" Syntax checking
Bundle 'scrooloose/syntastic' 

" Snippet managemet (Code template)
Bundle 'SirVer/ultisnips' 

" Simpler way to move
Bundle 'Lokaltog/vim-easymotion' 

" Show undo tree
Bundle 'sjl/gundo.vim' 

" Filesystem explorer
Bundle 'vim-scripts/The-NERD-tree' 

" Auto closing tool
Bundle 'Raimondi/delimitMate'

" Sublime Text-like multiple selection
Bundle 'terryma/vim-multiple-cursors'

" Show marks
Bundle 'vim-scripts/ShowMarks'

" Surround
Bundle 'tpope/vim-surround'

" Converts all compiler errors into signs
Bundle 'vim-scripts/errormarker.vim'

" Taglist replacement
Bundle 'vim-scripts/Tagbar' 

" Ctags and global management for global
Bundle 'carylorrk/vim-autotags-gtags'
" for cscope
"Bundle 'vim-scripts/autotags'

" Comment and uncomment
Bundle 'scrooloose/nerdcommenter'

" Ack for vim (grep for source code)
" Need Ack (ubuntu: apt-get install ack-grep)
Bundle 'mileszs/ack.vim'

" Maintains a history of previous yanks, changes and deletes
Bundle 'vim-scripts/YankRing.vim'

" Color Scheme
Bundle 'chriskempson/vim-tomorrow-theme'

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=1000

set nocp

" store session option
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Set to auto read when a file is changed from the outside
set autoread

" Regen tags
"if has("cscope")
    "nmap <F8> :!find . -type f -regextype posix-egrep -regex ".*\.(h\|c\|cpp)$" -print0 \| xargs -0 ctags --c++-kinds=+pl --fields=+iaS --extra=+q; rm -f ./cscope.*; find . -type f -regextype posix-egrep -regex ".*\.(h\|c\|cpp)$" -print \| sed 's,^\./,,' > ./cscope.files; cscope -b   <CR>
"else
    "nmap <F8> :!find . -type f -regextype posix-egrep -regex ".*\.(h\|c\|cpp)$" -print0 \| xargs -0 ctags --c++-kinds=+pl --fields=+iaS --extra=+q <CR>
"endif

" Debug after make file
nmap ,n :cn <CR>
nmap ,p :cp <CR>
nmap ,l :cl <CR>

nmap <C-S> :w <CR>

" global tags
set tags+=$HOME/.vim/bundle/GlobalCppTags/tags

"if has("cscope")
"    :cs add $HOME/.vim/bundle/GlobalCppTags/cscope.out
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make backup file
set backup

" where to put backup file (don't forget to make a backup directory)
set backupdir=$HOME/.tmp/vim/backup,./.backup,.,/tmp

" directory is the directory for temp file
set directory=$HOME/.tmp/vim/tmp,.,/var/tmp,/tmp

" Undo persistence
set undofile
set undodir=$HOME/.tmp/vim/undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical
set so=5

set wildmode=longest:full
set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set hid "Change buffer - without saving

set backspace=2

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things
set incsearch " Makes search act like search in modern browsers

set magic "Set magic on, for regular expressions

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
colorscheme Tomorrow
set background=dark
set cursorline
hi LineNr ctermfg=DarkGray
hi CursorLine term=bold cterm=bold ctermbg=Black


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set ai
set si
set wrap

""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Tab configuration
nmap  <F9>  :tabnew      <CR>
nmap  <F10> :tabclose    <CR>
nmap  <F11> :tabprevious <CR>
nmap  <F12> :tabnext     <CR>
nmap <C-W>c :tabnew      <CR>
nmap <C-W>K :tabclose    <CR>
nmap <C-P>  :tabprevious <CR>
nmap <C-N>  :tabnext     <CR>

""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	else
		return ''
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
"map ss :setlocal spell!<cr>
"map nss :setlocal nospell!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    " use both global and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    set csto=0

    " use cscope
    "if filereadable("cscope.out")
        "cs add cscope.out
    "elseif $CSCOPEDB != ""
        "cs add $CSCOPEDB
    "endif

    " use global
    set cscopeprg=gtags-cscope

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.

    " add any cscope database in current directory
    if filereadable("GTAGS")
        cs add GTAGS
    " else add the database pointed to by environment variable 
    elseif $GTAGS != ""
        cs add $GTAGS
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "

    " open in place
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

    " open in s split
    nmap <C-\>ss :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>sg :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>sc :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>st :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>se :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>sf :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-\>si :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-\>sd :scs find d <C-R>=expand("<cword>")<CR><CR>

    " open in v split
    nmap <C-\>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-\>vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-\>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    set timeoutlen=5000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    set ttimeoutlen=100

endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omnicpp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Leader><TAB>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader><Leader>e :NERDTreeToggle <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader><Leader>l :TagbarToggle <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader><Leader>u :GundoToggle <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EazyMotion setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Multiple Cursors setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_key = '<C-G>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mark setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:showmarks_enable = 0
nmap \ms :marks <CR>
nmap \md :delm! <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Leader><Leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_regexp = 0
let g:ctrlp_extensions = [ 'tag', 'buffertag' ]
let g:ctrlp_switch_buffer = 0
nmap <Leader><Leader>b :CtrlPBuffer <CR>
nmap <Leader><Leader>r :CtrlPMRU <CR>
nmap <Leader><leader>tg :CtrlPTag <CR>
nmap <Leader><leader>tl :CtrlPBufTag <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YankRing setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankring_replace_n_pkey = '<Leader><Leader>p'
let g:yankring_replace_n_nkey = '<Leader><Leader>n'
nnoremap <silent> <Leader><Leader>y :YRShow<CR>
let g:yankring_history_dir = $HOME."/.vim"
