" TODO:
" [ ] switch from syntastic to neomake?
" [ ] Use fancy icons (patched fonts):
"     https://github.com/ryanoasis/vim-devicons
"
" Handy tip:
" make a search with /myr?gexp
" then replace with s//something/c (empty pattern -> previous)


" Core Setup
" ==========

set nocompatible               " be iMproved
set hidden
filetype off                   " required by vundle

" copy/paste Sierra fix: http://stackoverflow.com/a/39741226/843194
set clipboard=unnamed

" set mouse=a
" set backspace=2

" No Menus
" ========
set guioptions+=lrbmTLce
set guioptions-=lrbmTLce
set guioptions+=c

" Avoid .swp'ing all over the place (be nice with clj-boot)
" =========================================================
set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

"No Ex Mode
map Q <Nop>

" remove trailing on save
autocmd BufWritePre * :%s/\s\+$//e

" Special file types
au BufNewFile,BufRead *.boot set filetype=clojure

" change the mapleader from \ to ,
let mapleader="\<SPACE>"

set scrolloff=7 " cursor always 7 lines away from border
set nowrap

" :set shiftwidth=4
" :command Spell setlocal spell spelllang=en_us
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" https://arusahni.net/blog/2015/04/switching-to-neovim-part-2.html
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" Plugins
" =======

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin(s:editor_root . '/bundle')

Plugin 'gmarik/Vundle.vim'

" Remote
" ------
" /!\ node-host requires npm and node /!\
" after install: navigate to the node-host directory
" (e.g. ~/.nvim/bundle/node-host) and run npm install
" Used for: nvim-parinfer.js
Plugin 'neovim/node-host'

" System
" ------

" switch colorscheme: `:colorscheme hybrid/solarized'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine' " show line indentation with thin vertical lines

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive' " git

Plugin 'scrooloose/nerdcommenter'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'easymotion/vim-easymotion'

Plugin 'Shougo/deoplete.nvim'

" Plugin 'sjl/gundo.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'Shougo/neosnippet.vim' " snipmate.neovim
" Plugin 'lsenta/neosnippet-snippets'
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-ctrlspace/vim-ctrlspace' " fancy nav & project mgmnt
" Plugin 'neomake/neomake' " syntax checking / syntastic.neovim
" Plugin 'vim-syntastic/syntastic'
" Plugin 'mhinz/vim-startify' " start screen

" ## Tools
Plugin 'vim-scripts/DrawIt'

" Clojure
" -------

Plugin 'snoe/nvim-parinfer.js'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Plugin 'tpope/vim-repeat'
" Plugin 'guns/vim-sexp'
" Plugin 'guns/vim-clojure-static'
" Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
" Plugin 'venantius/vim-eastwood' " no clojurescript
" Plugin 'venantius/vim-cljfmt' " no clojurescript

" Go
" --

Plugin 'fatih/vim-go'


" Python
" ------
Plugin 'zchee/deoplete-jedi'
" Plugin 'python-rope/ropevim.git'

" Java
" ----
Plugin 'artur-shaik/vim-javacomplete2'

" Files
" -----
Plugin 'chrisbra/csv.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Theming
" =======

syntax enable
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline\ 14
colorscheme solarized

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" colorscheme hybrid


" airline
" -------
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1 " sexy format, requires custom fonts

" 80 column marker
" ----------------
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" --------------------------
set wildmode=longest,list,full " longest=fill as much as possible, list=selection list, full=show all options first
set wildmenu

" Line Numbers
" ------------
:set number         "line numbering
:set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Rainbow Parenthesis
" -------------------
let g:rainbow#max_level = 16

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END


" Configuration
" =============

" Enter follows links
nmap <ENTER> <C-]>

" easymotion
" ----------
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
map  <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" jumping around
" --------------

" m- remove mark
" m_ (shift -) remove all marks
" m[symbol] set mark
" M[symbol] jump to mark
map M `
" '[symbol] jump to mark, line begin
map m_ :delmarks A-Z0-9a-z<CR>
map <Leader>m :marks<CR>

" NERDTreeToggle
" --------------
map <C-Q> :NERDTreeToggle<CR>
imap <C-Q> <ESC>:NERDTreeToggle<CR>a
let NERDTreeIgnore = ['\.pyc$']

" nerdcommenter
" -------------

" [count]<leader>REST:
" -  ci: toggle each line
" -  cA: comment Append
" -  cu: uncomment
" -  cc: comment current (line / selection)
" -  cn: comment nested (cc + nesting)
" -  c<space>: toggle commenting
" -  cs: comment sexy
" -  c$: comment to end of line
" -  ca: comment alternate deliminiters

" ctrl-p
" ------
" ignore .gitignore:
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

imap <C-E> <ESC>:CtrlPTag<CR>
map <C-E> :CtrlPTag<CR>


" deoplete (autocomplete)
" -----------------------
set smartcase

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#jedi#show_docstring = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Let <Tab> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" vim-sexp-mapping-for-regular-people
" --------- laurent edition ---------
" remap navigation using: (f)orm/(e)lement (h)/(l) motion
" map fl >f
" map fh <f
" map el >e
" map eh <e
" map fi <I
" map fa >I
"
" " (e)lement (s)urround with symbol "(" "[" "{"
" map es cse
" " (f)orm (d)elete (remove surroundings)
" map fd dsf

" Simplify
" ========

" system copy and paste -> C-x y/p
:map <C-X> "+

" when a IDE user takes your keyboard
:map <C-S> :w<CR>
:imap <C-S> <ESC>:w<CR>a

" shift-tab
" /!\ ctrl+i == tab

noremap <Leader>o <C-I>
noremap <Leader>u <C-O>
map <Leader>i :jumps<CR>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

vmap <Tab> >
vmap <S-Tab> <


" >>   Indent line by shiftwidth spaces
" <<   De-indent line by shiftwidth spaces
" 5>>  Indent 5 lines
" 5==  Re-indent 5 lines
"
" >%   Increase indent of a braced or bracketed block (place cursor on brace first)
" =%   Reindent a braced or bracketed block (cursor on brace)
" <%   Decrease indent of a braced or bracketed block (cursor on brace)
" ]p   Paste text, aligning indentation with surroundings
"
" =i{  Re-indent the 'inner block', i.e. the contents of the block
" =a{  Re-indent 'a block', i.e. block and containing braces
" =2a{ Re-indent '2 blocks', i.e. this block and containing block
"
" >i{  Increase inner block indent
" <i{  Decrease inner block indent


" Buffer navigation
" -----------------

map <S-j> <C-w>j
map <S-k> <C-w>k
map <S-l> <C-w>l
map <S-h> <C-w>h

map <Leader>\| :vsplit<CR>
map <Leader>\ :vsplit<CR>
map <Leader>- :split<CR>
