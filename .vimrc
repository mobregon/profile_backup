" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim
set bs=indent,eol,start
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command
                        " line history
                        "
set undolevels=1500
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
 syntax on 

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
set hlsearch

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals
"
"if has("autocmd")
"  " In text files, always limit the width of text to 78 characters
"    autocmd BufRead *.txt set tw=78
"      " When editing a file, always jump to the last cursor position
"        autocmd BufReadPost *
"  \ if line("'\"") > 0 && line ("'\"") <= line("$") | 
"  \   exe "normal! g'\"" |
"  \ endif
"endif


" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
       if filereadable("cscope.out")
             cs add cscope.out
   "             " else add database pointed to by environment
                   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

set ls=2            		" allways show status line
set tabstop=4       		" numbers of spaces of tab character
set shiftwidth=4    		" numbers of spaces to (auto)indent
set scrolloff=3     		" keep 3 lines when scrolling
set showcmd         		" display incomplete commands
set hlsearch        		" highlight searches
set incsearch       		" do incremental searching
set ruler           		" show the cursor position all the time
set visualbell t_vb=    	" turn off error beep/flash
set novisualbell    		" turn off visual bell
"set nobackup        		" do not keep a backup file
set number          		" show line numbers
set ignorecase      		" ignore case when searching
set autoread				" Set autoread when the file is changed
