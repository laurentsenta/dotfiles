" 80 column marker
" ----------------
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


" Menu auto-complete
" ------------------
set wildmenu
set wildmode=longest,list,full
" longest=fill as much as possible, list=selection list, full=show all options first


" Line Numbers
" ------------
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

set number         "line numbering
set relativenumber
nnoremap <leader>n :call NumberToggle()<cr>


" Buffer navigation
" -----------------
map <S-j> <C-w>j
map <S-k> <C-w>k
map <S-l> <C-w>l
map <S-h> <C-w>h

map <Leader>\| :vsplit<CR>
map <Leader>\ :vsplit<CR>
map <Leader>- :split<CR>

" Simplify
" --------
" system copy and paste -> C-x y/p
map <C-X> "+

" IDE style save
map <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>a

" Indentation
" -----------

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

