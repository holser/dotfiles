function! AutoCorrect()
    ia dont don't
endfunction

autocmd filetype text call AutoCorrect()
autocmd filetype rst call AutoCorrect()
