call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" enable all features
set nocompatible

" Wrap too long lines
set wrap
set linebreak

" Tabs are 4 characters
set tabstop=4

" (Auto)indent uses 4 characters
set shiftwidth=4

" spaces instead of tabs
set expandtab

" set indentation
set nowrap
set autoindent
set smartindent
set cindent

" Expand the command line using tab
set wildchar=<Tab>

" show line numbers
set number

" show tabs and eol
set listchars=tab:▸\ ,eol:$
set nolist

" Fold using markers {{{ like this }}}
"set foldmethod=marker

" show status line
set laststatus=2

" powerful backspaces
set backspace=indent,eol,start

" highlight the search term
set hlsearch

" enable spelling
set spell
set spell spelllang=en_us

" jump to the matches while typing
set incsearch

" ignore case while searching
" set ignorecase

" don't wrap words
set textwidth=0

" history
set history=1000

" 1000 undo levels
set undolevels=1000

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" write before hiding a buffer
set autowrite

" ---more--- like less
set more

" lines above/below cursor
set scrolloff=5

" window title
set title

" we use a dark background, don't we?
set bg=dark

" auto-detect the filetype
filetype plugin indent on

" Always show the menu, insert longest match
set completeopt=menuone,longest

" enables filetype detection
"filetype on

" enables filetype specific plugins
"filetype plugin on

" syntax highlight
syntax on

" cursor background highlight
"set cursorline
"set cursorcolumn

" set static colorcolumn at 90 chars
set colorcolumn=91
highlight ColorColumn ctermbg=235

" allows hidden buffers to stay unsaved, but we do not want this, so comment it out.
"set hidden

"set wmh=0

" auto-detect the filetype
"filetype plugin indent on

" Fold using markers {{{ like this }}}
"set foldmethod=marker

" local vimrc support
set exrc
set secure

" some color definitions
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLine term=bold cterm=bold ctermbg=235
highlight CursorColumn ctermbg=235
highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=undercurl
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" cpp highlighting for arduino files
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" lisp highlighting for lispy files
autocmd BufNewFile,BufReadPost *.lspy set filetype=lisp

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" syntax highlighting groups
hi Comment      ctermfg=12
hi Constant     ctermfg=6
hi Identifier   ctermfg=4
hi Statement    ctermfg=2
hi PreProc      ctermfg=1
hi Type         ctermfg=3
hi Special      ctermfg=5
hi Underlined   ctermfg=7
hi Ignore       ctermfg=9
hi Error        ctermfg=11
hi Todo         ctermfg=1


" #### xterm, rxvt - cursor color ####
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  "autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif
" #### End. xterm, rxvt - cursor color ####

" #### PHP ####
" PHP Code Sniffer binary (default = "phpcs")
let g:phpqa_codesniffer_cmd="~/.bin/php/PHP_CodeSniffer/scripts/phpcs"
" PHP Mess Detector binary (default = "phpmd")
"let g:phpqa_messdetector_cmd='~/.bin/php/phpcs')
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 1
" #### End PHP ####

" #### Airline ####
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" #### GitGutter ####
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
highlight GitGutterAddLine ctermfg=NONE ctermbg=235 cterm=NONE
highlight GitGutterChangeLine ctermfg=NONE ctermbg=235 cterm=NONE
highlight GitGutterDeleteLine ctermfg=NONE ctermbg=234 cterm=NONE
highlight GitGutterChangeDeleteLine ctermfg=NONE ctermbg=235 cterm=NONE
highlight clear SignColumn


" #### GPG - Transparent editing of gpg encrypted files ####
augroup encrypted
au!
" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
" Switch to binary mode to read the encrypted file
autocmd BufReadPre,FileReadPre      *.gpg set bin
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
" Switch to normal mode for editing
autocmd BufReadPost,FileReadPost    *.gpg set nobin
autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
" Convert all text to encrypted text before writing
autocmd BufWritePre,FileWritePre    *.gpg set bin
autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
" Undo the encryption so we are back in the normal text, directly
" after the file has been written.
autocmd BufWritePost,FileWritePost  *.gpg silent u
autocmd BufWritePost,FileWritePost  *.gpg set nobin
augroup END

" ######## Solarized test area ##########"
" let g:solarized_termcolors=256
" let g:solarized_visibility= "normal"
" let g:solarized_termtrans = 1
" let g:solarized_contrast = "low"
" syntax enable
" set background=dark
" colorscheme solarized
" ######## End solarized test area ##########"
"
" ############# Latex ################### "
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" ######## NerdTree ############ "
let NERDTreeHijackNetrw=1

" ####### you complete me ##### "
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" ##### Kick the habit ######## "
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ####### Java stuff ###### "
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" ###### Hardtime ##### "
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2

" ####### CtrlP stuff ##### "
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|output|bower_components|dist)|(\.(swp|hg|git|svn))$'
let g:ctrlp_root_markers = ['.ctrlp']
