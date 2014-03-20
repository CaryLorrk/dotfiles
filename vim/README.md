VIM setting
===========

vimrc.\* need to be sourced by .vimrc manually.

vimrc.local
-----------
Some basic setting.

vimrc.plugin
------------
Plugins downloaded by Vundle and plugins setting.
Need download Vundle firstl.

###prerequisites
* Ack

    apt-get install ack-grep

* Airline

    Need patched font, see [powerline](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation)

* Instant Markdown

    Instant Markdown previews from VIM
    Need some prerequisites.
    gem install pygments.rb
    gem install redcarpet -v 2.3.0
    npm config set registry http://registry.npmjs.org/
    npm -g install instant-markdown-d
    ndg-utils

* YouCompleteMe

    apt-get install build-essential cmake python-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
    if jedi is not founded, run 'git submodule update --init --recursive' at YCM

Useful cammand/binding
-----------

### Basic
#### Tab
* `[g` / `]g` / `[G` / `]G` - go to previous / next / first / last tab
* `<C-W>c`                  - open new tab
* `<C-W>K`                  - close tab
* `{count}gt`               - go to tab {count}
* [Session](#session)       - session management

#### Buffer
* :bd close current buffer
* [Unimpaired](#unimpaired) - pairs of handy bracket mappings
* [CtrlP](#ctrlp)           - fuzzy search buffer

#### Window
* `<C-H>` `<C-J>` `<C-K>` `<C-L>` - move left / down / up / right
* `<C-W>T`                        - move window to new tab
* :sp                             - split current window
* :vs                             - split vertically

####Fold
* `<Space>` `za` - toggle the fold
* zR             - open all folds
* zM             - close all folds

####Mark
* ,ms       - show all marks
* ,md       - delete current mark
* m{a-zA-Z} - set mark
* '{a-zA-Z} - jump to mark

###File Navigation
* [CtrlP](#ctrlp)                - fuzzy search file
* [Eunuch](#eunuch)              - UNIX file operation
* [File line](#fileline)         - enabling opening a file in a given line
* [Fugitive](#fugitive)          - git for VIM
* [Github Search](#githubsearch) - search Github and clone repos
* [NERDTree](#nerdtree)          - filesystem explorer

###Search/Code Navigation
* *                                   - search the word under cursor or selection in visual mode
* #                                   - reverse search
* [Abolish](#abolish)                 - search variations
* [Ack](#ack)                         - grep-like search
* [Argumentative](#argumentative)     - manipulating and moving between function arguments
* [Autotags](#autotags)               - ctags and cscope/global management
* Colorize
    * [Colorizer](#colorizer)         - color ansi sequences, hex code and color name
    * [Indent Gudies](#indentguides)  - visually displaying indent levels
    * [Rainbow Parentheses](rainbow)  - colorize parentheses
* [CtrlP](#ctrlp)                     - fuzzy search tag
* [EasyMotion](#easymotion)           - used to replace the default search
* [Gundo](#gundo)                     - undo tree
* [Multiple Cursor](#multiple-cursor) - choose multiple selection and operate
* [NERDCommenter](#nerdcommenter)     - easy comment
* [TagBar](#tagbar)                   - browse tag
* [TaskList](#tasklist)               - vew task list

###Programming/Writing
* [Auto Pairs](#autopair)                                         - insert or delete brackets, parens, quotes in pair
* [DoxygenToolkit](#doxygentoolkit)                               - generate Doxygen documentation for C/C++, Python
* [EasyAlign](#easyalign)                                         - easy align
* [Emmet](#emmet) - write HTML in a CSS                           - like syntax
* [Linediff](#linediff)                                           - perform diffs on blocks of code
* [NrrwRgn](#nrrwrgn)                                             - focussing on a region and making the rest inaccessible
* [Python Mode](#pythonmode)                                      - all you need to create python application
* [Speeddating](#speeddating) - use CTRL-A/CTRL                   - X to increment dates, times, and more
* [Ultisnips](#ultisnips)                                         - snippes (code template)
* [YouCompleteMe](#ycm) - autocomplete and sematic checking for C - family and python
* [Runtime](#runtime)                                             - runtime files
* [Text Object](#object)                                          - text object extensions

###Plugins

<a href="" name="abolish"></a>
####[Abolish](https://github.com/tpope/vim-abolish)
* :S/facilit{y,ies}               - search several variations of a word at once
* :S/address{,es}/reference{,s}/g - substitude several variantions of a word at once

<a href="" name="ack"></a>
####[Ack](https://github.com/mileszs/ack.vim)
* `:Ack` - grep-like search

<a href="" name="argumentative"></a>
####[Argumentative](https://github.com/PeterRincker/vim-argumentative)
* `<,` `>,` - shifting arguments
* `[,` `],` - moving between argument

<a href="" name="autotags"></a>
####[Autotags](https://github.com/CaryLorrk/vim-autotags-gtags)
* `,4` - generate tags and reindex
* `,3` - add aditional tags

<a href="" name="autopair"></a>
####[Auto Pairs](https://github.com/jiangmiao/auto-pairs)
* `<C-P>a` - toggle auto pairs
* `<C-P>e` - fast wrap the word

<a href="" name="calendar"></a>
####[Calendar](https://github.com/mattn/calendar-vim)
* `,cal` `,caL` - open calendar

<a href="" name="colorizer"></a>
####[Colorizer](https://github.com/chrisbra/Colorizer)
* `,,c` - toogle colorizer

<a href="" name="ctrlp"></a>
####[CtrlP](https://github.com/kien/ctrlp.vim)
* `,f` / `,F` / `,t` - full path fuzzy file / buffer / buffer tag finder
* `<C-R>` / `<C-D>`  - toggle regex / filename

<a href="" name="dispatch"></a>
####[Dispatch](https://github.com/tpope/vim-dispatch)
* `:Make` - using current compiler setting and dispatch a build
* `,q` - load latest build into quickfix an open
* `:Dispatch` - run program and dispatch
* `:Start` - Start a process in a window

<a href="" name="Doxygentoolkit"></a>
####[DoxygenToolkit](https://github.com/vim-scripts/DoxygenToolkit.vim)
* `:Dox` - dox class, function
* `:DoxAuthor` - dox author, version and datetime
* `:DoxLic` - dox license

<a href="" name="easyalign"></a>
####[EasyAlign](https://github.com/junegunn/vim-easy-align)
* `<Enter>` in visual mode - builtin alignment
* `,a` in visual mode      - alignment by regex

<a href="" name="easymotion"></a>
####[EasyMotion](https://github.com/Lokaltog/vim-easymotion)
* `f` / `F`                              - search character in line / page
* `/` + `<TAB>`  / `<S-TAB>` + `<Enter>` - search multiple character
* `{operator},p` / `{operator},l`        - range operation

<a href="" name="emmet"></a>
####[Emmet](https://github.com/mattn/emmet-vim)
* `<C-E>`             - expand abbreviation (wrap text by tag in visual mode)
* `<C-Y>n` / `<C-Y>N` - move next / previous
* `<C-Y>K`            - remove tag
* `<C-Y>;`            - expand word
* `<C-Y>a` `<C-Y>A`   - anchroize url
* `<C-Y>c`            - change code block to  html
* `<C-Y>/`            - toggle comment
* `<C-Y>i`            - image size
* some example:
    * ul>li\*3>a[href="xxx$"]
    * code>p{hahaha}
    * [more tutorial](https://raw.github.com/mattn/emmet-vim/master/TUTORIAL)
* [pattern](http://docs.emmet.io/abbreviations/syntax/)


<a href="" name="eunuch"></a>
####[Eunuch](https://github.com/tpope/vim-eunuch)
* `:Remove`                 - delete file
* `:Move`                   - :saveas and delete old file
* `:Rename`                 - like :Move but relative to current file's containing directory
* `:Chmod`                  - change permission
* `:Find` / `Locate`        - run find / locate and load the results into quickfix
* `:SudoEdit` / `SudoWrite` - sudo edit / write file

<a href="" name="fileline"></a>
####[File line](https://github.com/bogado/file-line)
* `:e {filename}:{number}` - edit filename and jump to number line

<a href="" name="fugitive"></a>
####[Fugitive](https://github.com/tpope/vim-fugitive)
* `:Git`     - git command
* `:Gstatus` - add/reset file
    * `-`  - add and reset file
    * `cc` - Gcommit
    * `ca` - Gcommit --amend
    * `D`  - Gdiff
    * `o`  - Gsplit
* `:Gblame`  - show detail commit status for each line
* `:Gcommit` - commit
* `:Gdiff`   - diff
* `:Gmove`   - git mv and rename buffer
* `:Gremove` - delete current file and buffer
* `:Gread`   - git checkout that operates on the buffer
* `:Gwrite   - write to both the work tree and index versions of a file
* `:Gbrowse` - open file in github
* `:Glog`    - load previous revisions of current file into quickfix
* `:Glog --` - load ancestral commit objects into quickfix list

<a href="" name="githubsearch"></a>
####[Github Search](https://github.com/gmarik/github-search.vim)
* `:GHSearchRepo` - search Github and clone repos

<a href="" name="greplace"></a>
####[Greplace](https://github.com/skwp/greplace.vim)
* `:Gsearch`  - global search and edit
* `:Greplace` - merge changes

<a href="" name="gundo"></a>
####[Gundo](https://github.com/sjl/gundo.vim)
* `,u` - undo tree

a[mame="indentguides"]
####[Indent Guides](https://github.com/nathanaelkane/vim-indent-guides)
* `,,i` - toggle indent visualization

<a href="" name="linediff"></a>
####[Linediff](https://github.com/AndrewRadev/linediff.vim)
* `:Linediff` - set diff block

<a href="" name="multiple-cursor"></a>
####[Multiple Cursor](https//github.com/)
* `<C-N>` - choose word or selection
* `<C-X>` - skip to next
* `<C-P>` - go to previous

<a href="" name="nerdcommenter"></a>
####[NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* `,cc`             - comment
* `,cA`             - append comment to end of line
* `,ci` `,c<Space>` - toggle comment
* `,caa`            - switch delimiters
* `,cu`             - uncomment

<a href="" name="NERDTree"></a>
####[NERDTree](https://github.com/vim-scripts/The-NERD-tree)
* `,e` - fileexplorer

<a href="" name="nrrwrgn"></a>
####[NrrwRgn](https://github.com/chrisbra/NrrwRgn)
* `:NR` - focus on selected region

<a href="" name="pythonmode"></a>
####[Python Mode](https://github.com/klen/python-mode)
* `,b` - add/remove breakpoints
* `:PymodeLint` / `:PymodeLintAuto` - code check / autofix
* `K` `:PymodeDoc` - show document by pydoc
* `:PymodeRopeNewProject` -- Open new Rope project in current working directory
* `<C-C>d` - show doc
* `<C-C>g` - go to definition
* `<C-C>f` - find
* `<C-C>r...` - refactoring. example:
    * `<C-C>rm` - extract method
    * `<C-C>rr` - rename
    * `<C-C>ro` - organize import

<a href="" name="quickrun"></a>
####[Quickrun](https://github.com/thinca/vim-quickrun)
* `,r` `:Q` - execute current buffer
* :[range]QuickRun [{type}] [<{input}] [>[>][{output}]] [-option value]...

<a href="" name="rainbow"></a>
####[Rainbow Parentheses](https://github.com/kien/rainbow_parentheses.vim)
* `,,r` - colorize parentheses

<a href="" name="session"></a>
####[Session](https://github.com/xolox/vim-session)
* `,ss` / `,so` / `sd` - save / open / delete session named directory at ~/.vim/session
* `,sc`                - close session

<a href="" name="speeddating"></a>
####[Speeddating](https://github.com/tpope/vim-speeddating)

<a href="" name="surround"></a>
####[Surround](https://github.com/tpope/vim-surround)
* `ys{object}` / `yss` - wraps object / line
* `yS{object}` / `ySS` - wraps object / line and place in a line of its own
* `cs` / `ds`          - change / delete surround

<a href="" name="tagbar"></a>
####[TagBar](https://github.com/vim-scripts/Tagbar)
* `<,l>` - open tag bar

<a href="" name="tasklist"></a>
####[TaskList](https://github.com/vim-scripts/TaskList.vim)
* `,v` - view task list

<a href="" name="ultisnips"></a>
####[Ultisnips](https://github.com/SirVer/ultisnips)
* `{snippet}<TAB>`   - expand snippet

<a href="" name="unimpaired"></a>
####[Unimpaired](https://github.com/tpope/vim-unimpaired)
* `[b` / `]b` / `[B` / `]B`             - go to previous / next / first / last buffer
* `[l` / `]l` / `[L` / `]L`             - go to previous / next / first / last in location list
* `[c` / `]c` / `[C` / `]C`             - go to previous / next / first / last in quickfix
* `[f` / `]f`                           - go to the file preceding / succeeding the current one alphabetically
* `{count}[<Space>` / `{count}]<Space>` - add {count} blank lines above / below the cursor
* `{count}[e` / `{count}]e`             - exchange the current line with {count} lines above / below it
* `con` / `cor`                         - toggle 'number' and 'relativenumber'
* `cos`                                 - toggle `spell`
* `coc` / `cou` / `cox`                 - toggle 'cursorline' /	'cursorcolumn' / both
* `[x` / `]x` / `[u` / `]u`             - XML / URL encoding / decoding

<a href="" name="yarkring"></a>
####[YankRing](https://github.com/vim-scripts/YankRing.vim)
* `,p`  - previous past
* `,n`  - next past
* `,yr` - show entries in the yankring

<a href="" name="ycm"></a>
####[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* `,yy`         - show errors or warnings in location list
* `,yf`         - force compile and diagnostics
* `,yd` / `,yc` - go to definition else declaration / declaration

<a href="" name="runtime"></a>
####Runtime Files
* [Markdown](https://github.com/plasticboy/vim-markdown)
* [Git](https://github.com/tpope/vim-git)
* [Tmux](https://github.com/Keithbsmiley/tmux.vim)
* [HTML5](https://github.com/othree/html5.vim)
* [Javascript](https://github.com/pangloss/vim-javascript)

<a href="" name="object"></a>
####Text Object
* [vim-textobj-user](https://github.com/kana/vim-textobj-user) - create your own text objects
* default
    * word          - `iw` `iW` `aw` `aW`
    * sentence      - `as` `is`
    * paragraph     - `ap` `ip`
    * [] block      - `a]` `a[` `i]` `i[`
    * () block      - `a)` `a(` `ab` `i)` `i(` `ib`
    * <> block      - `a>` `a<` `i>` `i<`
    * tag block     - `at` `it`
    * {} block      - `a}` `a{` `aB` `i}` `i{` `iB`
    * quoted string - `a"` `a'` `` a` `` `i"` `i'` ``i` ``
* [function](https://github.com/kana/vim-textobj-function) - function for c and vim script
    * `af` `if`
* [underscore](https://github.com/lucapette/vim-textobj-underscore) - undercore. like c-style variable
    * `a\_` `i\_`
* [indent](https://github.com/michaeljsmith/vim-indent-object)
    * `ai` `aI` `ii` `iI`
* [targets](https://github.com/wellle/targets.vim/) - various text objects
    * some example:
        `2a)` `2I)` `I"` `a;`
    * [cheatsheet](https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
* [datetime](https://github.com/kana/vim-textobj-datetime/blob/master/doc/textobj-datetime.txt) - for date and time
    * `ada` `adf` `add` `adt` `adz` `ida` `idf` `idd` `idt` `idz`
* [entire](https://github.com/kana/vim-textobj-entire) - entire buffer
    * `ae` `ie`
* [word column](https://github.com/coderifous/textobj-word-column.vim)
    * `ic` `ac` `iC` `aC`
* [python modoe](https://github.com/klen/python-mode) - for python
    * `iC` `aC` - class
    * `iM` `aM` - method (function)


###Others
* [Vundle](https://github.com/vim-scripts/errormarker.vim)                      - plugin management
* [Airline](https://github.com/bling/vim-airline)                               - vim status line, tmux status line and shell prompt
* [Color Scheme](https://github.com/chriskempson/vim-tomorrow                   - theme)
* [CtrlR](https://github.com/goldfeld/ctrlr.vim) - ex command history reverse-i - search
* [Errormarker](https://github.com/vim-scripts/errormarker.vim)                 - converts all compiler errors into signs
* [Instant Markdown](https://github.com/suan/vim-instant-markdown)              - instant Markdown previews from VIM
* [Endwise](https://github.com/tpope/vim-endwise)                               - wisely "end" endfunction/endif/more in vim script
* [Localvimrc](https://github.com/vim-scripts/localvimrc)                       - local vimrc (.lvimrc)
* [Matchit.zip](https://github.com/vim-scripts/matchit.zip)                     - configure % to match more thane just single characters.
* [Shebang](https://github.com/vitalk/vim-shebang)                              - vim filetype detection by the shebang
* [Syntastic](https://github.com/scrooloose/syntastic)                          - syntax checking
* [Repeat](https://github.com/tpope/vim-repeat)                                 - repeat previous action
* [Startify](https://github.com/mhinz/vim-startify)                             - a fancy start screen
