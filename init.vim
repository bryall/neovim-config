" vim: foldmethod=marker foldcolumn=3

"""""""""""""""""""
" Display {{{1

" jellybeans theme
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans

" highlight current cursor line, with a notch after column 80
set cursorline
set colorcolumn=81

" show line numbers
set number

" Toggle Showing/Hiding Whitespaces

" Toggle Showing and Hiding WHitespace characters
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Toggle Showing and Hiding WHitespace characters                                                                                                                                                                                           
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

"""""""""""""""""""
" Keyboard {{{1

" change <Leader> from default '\' to home-row-friendly ';'
let mapleader = ";"

" arrow keys navigate splits in normal mode; use hjkl for movement.
"nmap <Up> <C-W><Up>
"nmap <Down> <C-W><Down>
"nmap <Left> <C-W><Left>
"nmap <Right> <C-W><Right>

" move lines up/down, reindenting
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

" reselect visual block after shifting indentation
"vnoremap < <gv
"vnoremap > >gv

"""""""""""""""""""
" mouse {{{1

" Mouse for scrolling etc in console.
" a = normal + visual + insert + command-line + help files
set mouse=a

"""""""""""""""""""
" Behavior {{{1

" Setup tabs/spaces
set ts=4 sts=4 sw=4 expandtab

" Setup tabs/spaces
set ts=4 sts=4 sw=4 expandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
"If you want to map this function to a key
"nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

if has("autocmd")
    autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif



" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

