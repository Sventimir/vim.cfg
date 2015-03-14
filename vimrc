" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! archlinux.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin on

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Python autocompletion:
set omnifunc=syntaxcomplete#Complete

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

" Micellanea vel varia:
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set number
set history=1000        " Remember more commands and search history
set undolevels=1000     " Use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.hi,*.o
set title               " Change the terminal's title
set nobackup            " You've got version control, man!
set noswapfile          " Write changes often.
set pastetoggle=<F2>    " When on, typed content is treated as if it was pasted

" Nice 80-column wide document:
set tw=79
set colorcolumn=80
set fo-=t
set nowrap

" Environment variables
let mapleader=","       " Replaces standard mapleader (\)
let textwidth=80        " Helps with formatting.

" Statusline:
set laststatus=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Searching and regex:
set showcmd             " Show (partial) command in status line
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set showmatch           " Show matching brackets
set hlsearch            " Highlight all search pattern amatches
set magic               " Advance regexp. No need to escape special chars anymore
nmap <silent> <Leader>/ ;nohlsearch<CR>    " Clear searching buffer so that highligt disappears

" Indentation and tabulation
set tabstop=4
set softtabstop=4       " Backspace deletes multiple spaces up to 4 in sequence
set shiftwidth=4
set shiftround          " Uses multiplies of shiftwidth while indenting with '<' and '>'
set expandtab
set autoindent
set copyindent          " Maintains correct indentaion while copying
set foldmethod=indent   " Indentation-based folding.
vnoremap < <gv          " Indentation without losing selection
vnoremap > >gv

" Whitespaces and folding:
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd BufWinEnter *.* silent loadview     " Load folds on re-opening file

" Shortcut mappings:
" Normal mode:
nnoremap ; :
vnoremap ; :
nnoremap : ;    " ; normally goes to next char previously searched with f/t.
vnoremap : ;    " ; normally goes to next char previously searched with f/t.
vnoremap . :norm.<CR> " . working in visual mode.
nnoremap <silent> <press Ctrl-PageUp> :tabprev
nnoremap <silent> <press Ctrl-PageDown> :tabnext
nnoremap <silent> <press Ctrl-N> :tabnew<CR>
noremap <C-n> :tabnew
nnoremap <silent> <Leader>f zR  " Unfold all
nnoremap <silent> <Leader>F zM  " Fold all
nnoremap <silent> <C-y> byw
" Session management:
nnoremap <silent> <F3> :SaveSession<CR>    " Save as default
nnoremap <S-F3> :SaveSession
nnoremap <silent> <F4> :OpenSession<CR>    " Open default
nnoremap <S-F4> :OpenSession
nnoremap <silent> <F10> :CloseSession<CR>
nnoremap <silent> <F5> :RestartVim<CR>
let g:session_autosave = "yes"
let g:session_autoload = "no"

" Command mode:
cnoremap \fn <C-R>=expand("%:t")<CR>

" All modes:
noremap <silent> <A-Left> <C-w><Left>
noremap! <silent> <A-Left> <C-w><Left>
noremap <silent> <A-Up> <C-w><Up>
noremap! <silent> <A-Up> <C-w><Up>
noremap <silent> <A-Right> <C-w><Right>
noremap! <silent> <A-Right> <C-w><Right>
noremap <silent> <A-Down> <C-w><Down>
noremap! <silent> <A-Down> <C-w><Down>

let g:syntastic_python_checkers = ["pylint"]

" Haskell programming support:
au BufEnter *.hs compiler ghc
:let g:ghc="/usr/bin/ghc"
:let g:haddock_browser="/usr/bin/chromium"

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Enable ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["/usr/share/vim/vim74/vim-snippets/UltiSnips"]
