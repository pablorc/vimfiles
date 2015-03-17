"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" Vundles

Plugin 'burke/matcher'
Plugin 'vim-scripts/CSApprox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-haml'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Shougo/neocomplcache'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'akhil/scala-vim-bundle'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ciaranm/securemodelines'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'dgsuarez/thermometer'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-projectionist'
Plugin 'Townk/vim-autoclose'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'greyblake/vim-preview'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'lukaszb/vim-web-indent'
Plugin 'tpope/vim-rsi'

call vundle#end()            " required
filetype plugin indent on    " required


"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"""let mapleader = "ñ"
"""
""""mapping for command key to map navigation thru display lines instead
""""of just numbered lines
"""vmap <D-j> gj
"""vmap <D-k> gk
"""vmap <D-4> g$
"""vmap <D-6> g^
"""vmap <D-0> g^
"""nmap <D-j> gj
"""nmap <D-k> gk
"""nmap <D-4> g$
"""nmap <D-6> g^
"""nmap <D-0> g^

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

"statusline setup
set statusline=%f       "tail of the filename

"Syntastic

set statusline+=%#warningmsg#
set statusline+=\%{SyntasticStatuslineFlag()}
set statusline+=%*

"SCM

set statusline+=%{g:HgStatusLine()}
set statusline+=%{fugitive#statusline()}

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"display tabs and trailing spaces
"set list
"set listchars=tab:\ \ ,extends:>,precedes:<
" disabling list because it interferes with soft wrap

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden


if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set guitablabel=%M%t
    set lines=40
    set columns=115
    colorscheme pyte

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Monospace\ Regular\ 10
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h14
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        "map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
        set invmmta
        try
          set transparency=5
        catch
        endtry
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
    if match($TERM, "256") != -1
      set background=dark
      colorscheme solarized
    else
      colorscheme default
    endif

endif

let g:buffergator_suppress_keymaps = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

 let g:PreviewBrowsers='google-chrome,firefox'

silent! nmap <silent> <Leader>b :BuffergatorToggle<CR>
silent! nmap <silent> <Leader>p :NERDTreeTabsToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

let g:neocomplcache_enable_at_startup = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>


"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"snipmate setup

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"CtrlP

let g:ctrlp_custom_ignore = '\v.*\/vendor\/.*'

let g:path_to_matcher = "~/.vim/bin/matcher/matcher"

if !empty(glob(g:path_to_matcher))
  let g:ctrlp_match_func = { 'match': 'GoodMatch' }
endif

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction

let g:ctrlp_match_window_bottom=0
let g:ctrlp_match_window_reversed = 0

"map for ctrl-p
map <leader>t :CtrlP<CR>

"map for gundo
map <Leader>g :GundoToggle<CR>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <C-Tab> gt
nmap <C-S-Tab> gT

let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}

"Enabling Zencoding
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \  'erb' : {
  \    'extends' : 'html',
  \  },
 \}

au BufNewFile,BufRead *.prawn set filetype=ruby
let g:AutoCloseExpandEnterOn = ""

"options for markdown files
au BufNewFile,BufRead *.md set tw=78 formatoptions=t1 spell

noremap Q gqap

:imap jj <Esc>
