" turn off active search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Mapping for gracefully closing buffers with vim-bbye
:nnoremap <Leader>q :Bdelete<CR>

" Disable shortcut for entering Ex mode
nnoremap Q <nop>

" Set spellcheck toggle
imap <Leader>s <C-o>:setlocal spell! spelllang=en_us<CR>
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

" Toggle vertical centring of the cursor
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>:echo "scrolloff toggled"<CR>

" Neocomplete
" <CR>: close popup
if v:version < 800
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
else
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
endif

" Paste mode toggle
set pastetoggle=<Leader>p

" Hide matches on double esc
nnoremap <esc><esc> :noh<CR>

" Remove trailing whitespace on <leader>W
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Append current formatting
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
          \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

nmap <Leader>1 :set expandtab smarttab tabstop=2 shiftwidth=4 softtabstop=4<CR>
nmap <Leader>2 :set expandtab smarttab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Toggle show/hide invisible chars
nnoremap <leader>I :set list!<cr>

" Quickly close the current window
nnoremap <leader>Q :q<CR>
" Quickly close the current buffer
nnoremap <leader>q :bd<CR>

" Use F for formatting the current paragraph (or visual selection)
vnoremap F gw
nnoremap F gwap

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Quick yanking to the end of the line
nnoremap Y y$

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
