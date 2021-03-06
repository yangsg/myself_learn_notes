set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"|||" The following are examples of different formats supported.
"|||" Keep Plugin commands between vundle#begin/end.
"|||" plugin on GitHub repo
"|||Plugin 'tpope/vim-fugitive'
"|||" plugin from http://vim-scripts.org/vim/scripts.html
"|||Plugin 'L9'
"|||" Git plugin not hosted on GitHub
"|||Plugin 'git://git.wincent.com/command-t.git'
"|||" git repos on your local machine (i.e. when working on your own plugin)
"|||Plugin 'file:///home/gmarik/path/to/plugin'
"|||" The sparkup vim script is in a subdirectory of this repo called vim.
"|||" Pass the path to set the runtimepath properly.
"|||Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"|||" Install L9 and avoid a Naming conflict if you've already installed a
"|||" different version somewhere else.
"|||Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'sjl/badwolf'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shutnik/jshint2.vim'

Plugin 'sheerun/vim-polyglot'
"Plugin 'jelera/vim-javascript-syntax'  "better than vim-javascript
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'digitaltoad/vim-pug'  "Vim syntax highlighting for Pug (formerly Jade) templates. but already included in vim-polyglot
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'

Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'


Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
">> Install Plugins:
">> Launch vim and run :PluginInstall
">> To install from command line: vim +PluginInstall +qall

"===============================================================
" Syntax hightlight "
syntax on

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set relativenumber
set number
set norelativenumber

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = ","

" Set title to window
set title 
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
set mouse=a


"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

"|" Compile coffee script and goto specified line
"|autocmd FileType coffee,js,jade,styl,css,json autocmd BufWritePre <buffer> :%s/\s\+$//e
"|autocmd FileType coffee command! -nargs=1 C silent CoffeeCompile | :<args>

"|" Syntax highlight for github .md files "
"|au BufRead,BufNewFile *.md set filetype=markdown
"|
"|" pretty print json
"|nnoremap <C-S-F> :%!python -mjson.tool<CR> 


"set colorcolumn=79

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


"|" Map : to ; also in command mode.
"|nnoremap ; :
"|
"|" Set vim to save the file on focus out.
"|au FocusLost * :wa


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"


" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap g; g;zz

" =========== END Basic Vim Settings ===========

" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    colo badwolf
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorschem badwolf
endif

" Special Settings for Consoles
"if !has("gui_running")
"    set t_Co=256
"    colorschem badwolf
"endif
" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========





" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Mapping to NERDTree
"| nnoremap <C-n> :NERDTreeToggle<cr>
" > because vim-multiple-cursors use (let g:multi_cursor_next_key='<C-n>'), so use <C-t> for 'NERDTreeToggle'
nnoremap <C-t> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"| let g:syntastic_always_populate_loc_list = 1
let g:syntastic_always_populate_loc_list = 0
"| let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar key bindings."
"nmap <leader>l <ESC>:TagbarToggle<cr>
"imap <leader>l <ESC>:TagbarToggle<cr>i
nmap <F8> :TagbarToggle<CR>


" vim-multiple-cursors
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'



"===============================================================
" vim-easymotion (https://github.com/easymotion/vim-easymotion)
" The default leader has been changed to <Leader><Leader> to avoid conflicts
" with other plugins you may have installed.
" All motions will then be triggered with <Leader> by default, e.g. <Leader>s,  <Leader>gE.
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


"| Integration with incsearch.vim
"| haya14busa/incsearch.vim
"| haya14busa/incsearch-easymotion.vim
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

"| haya14busa/incsearch.vim
"| haya14busa/incsearch-fuzzy.vim
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"| map  n <Plug>(easymotion-next)
"| map  N <Plug>(easymotion-prev)

"==============================================================

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" SnipMate/UltiSnips integration #36
" https://github.com/Valloric/YouCompleteMe/issues/36
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"==============================================================
" YouCompleteMe ==========start===========
let g:ycm_key_invoke_completion = '<M-Space>'

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'nerdtree' : 1,
      \}

" I get a weird window at the top of my file when I use the semantic engine
"If you don't want this window to ever show up, add set completeopt-=preview to your vimrc. Also make sure that the g:ycm_add_preview_to_completeopt option is set to 0.
" https://github.com/Valloric/YouCompleteMe ----------------------
"let g:ycm_autoclose_preview_window_after_insertion = 0
"let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" UltiSnips and YouCompleteMe
" if you use Vundle, load plugins:
" Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" YouCompleteMe ==========end===========


"==========================================================
" Better colors for syntax highlighting
" If you have a black background, use the following command to get a better  color map for syntax highlighting:
set background=dark
" This function reverses background setting so you can quickly toggle between light and dark .
function! ReverseBackground()
 let Mysyn=&syntax
 if &bg=="light"
 se bg=dark
 else
 se bg=light
 endif
 syn on
 exe "set syntax=" . Mysyn
 echo "now syntax is "&syntax
endfunction
command! Invbg call ReverseBackground()
noremap <F11> :Invbg<CR>


" ==============================
" > -----------------http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux-----------------
" > -----------------enable split window can resize by dragging mouse in some programm context(eg: the 'screen' program window)-----------------

" Enable Mouse
set mouse=a

" >>>>>>>> note: the following setting can work on ubuntu but CentOS6.x. the following setting prevents the scrolling up and down in the right way on CentOS
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" <<<<<<<<

" >>>>>>> enable the following setting on CentOS6.x and disable the previous setting that can work on Ubuntu.
" if &term =~ '^screen'
"     " tmux knows the extended mouse mode
"     set ttymouse=xterm2
" endif
" <<<<<<<
" ==============================


