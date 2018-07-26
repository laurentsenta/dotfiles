" Ctrl+Space plugin
" -----------------

" if executable("ag")
"     let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif
" set showtabline=0
"
" map <C-SPACE> :CtrlSpace<CR>
" imap <C-SPACE> <ESC>:CtrlSpace<CR>
" " nnoremap <silent><C-p> :CtrlSpace O<CR>

" NERDTreeToggle
" --------------
map <C-Q> :NERDTreeToggle<CR>
imap <C-Q> <ESC>:NERDTreeToggle<CR>a
let NERDTreeIgnore = ['\.pyc$']

" Ctrl-P
" ------
" ignore .gitignore:
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

imap <C-E> <ESC>:CtrlPTag<CR>
map <C-E> :CtrlPTag<CR>

" Rainbow Parenthesis
" -------------------
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']']]
"
" " Activation based on file type
" augroup rainbow_lisp
"   autocmd!
"   autocmd FileType lisp,clojure,scheme RainbowParentheses
" augroup END

