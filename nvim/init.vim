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

" set backspace=2
set mouse=a
set conceallevel=0

" No Menus
" ========
set guioptions-=lrbmTLe
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

" change the mapleader from \ to space!
let mapleader="\<SPACE>"

set nowrap
set scrolloff=7 " cursor always 7 lines away from border
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

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
" Plugin 'w0ng/vim-hybrid' " brown-ish color scheme
Plugin 'altercation/vim-colors-solarized' " blue-ish classic

" ### UI
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine' " show line indentation with thin vertical lines

" ### Tools
" Plugin 'vim-ctrlspace/vim-ctrlspace' " fancy nav & project mgmnt
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/deoplete.nvim'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-fugitive' " git

" Plugin 'vim-scripts/DrawIt'

" Plugin 'scrooloose/nerdcommenter'
" Plugin 'easymotion/vim-easymotion'

" Plugin 'sjl/gundo.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'Shougo/neosnippet.vim' " snipmate.neovim
" Plugin 'lsenta/neosnippet-snippets'
" Plugin 'kshenoy/vim-signature'
" Plugin 'neomake/neomake' " syntax checking / syntastic.neovim
" Plugin 'vim-syntastic/syntastic'
" Plugin 'mhinz/vim-startify' " start screen

" ## Tools
" Plugin 'vim-scripts/DrawIt'

" Clojure
" -------

" Plugin 'guns/vim-clojure-static'
" Plugin 'junegunn/rainbow_parentheses.vim'
" Plugin 'snoe/nvim-parinfer.js'
" Plugin 'tpope/vim-fireplace'

" Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Plugin 'tpope/vim-repeat'
" Plugin 'guns/vim-sexp'
" Plugin 'guns/vim-clojure-highlight'
" Plugin 'venantius/vim-eastwood' " no clojurescript
" Plugin 'venantius/vim-cljfmt' " no clojurescript

" Go
" --

" Plugin 'fatih/vim-go'


" Python
" ------
" Plugin 'zchee/deoplete-jedi'
" Plugin 'python-rope/ropevim.git'

" Java
" ----
" Plugin 'artur-shaik/vim-javacomplete2'

" Files
" -----
" Plugin 'chrisbra/csv.vim'


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

" Configuration
" =============

" Enter follows links
" nmap <ENTER> <C-]>

" easymotion
" ----------
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>W <Plug>(easymotion-overwin-w)
" map  <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" jumping around
" --------------

" m- remove mark
" m_ (shift -) remove all marks
" m[symbol] set mark
" M[symbol] jump to mark
" map M `
" '[symbol] jump to mark, line begin
" map m_ :delmarks A-Z0-9a-z<CR>
" map <Leader>m :marks<CR>

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


" deoplete (autocomplete)
" -----------------------

call deoplete#enable()

set smartcase
let g:deoplete#enable_smart_case = 1

" " Let <Tab> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" "\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " vim-sexp-mapping-for-regular-people
" " --------- laurent edition ---------
" " remap navigation using: (f)orm/(e)lement (h)/(l) motion
" " map fl >f
" " map fh <f
" " map el >e
" " map eh <e
" " map fi <I
" " map fa >I
" "
" " " (e)lement (s)urround with symbol "(" "[" "{"
" " map es cse
" " " (f)orm (d)elete (remove surroundings)
" " map fd dsf


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

source $HOME/.config/nvim/basics.vim
source $HOME/.config/nvim/plugins.vim


