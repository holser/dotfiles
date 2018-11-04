" This work is licensed under the terms of the MIT license.
" For a copy, see <https://opensource.org/licenses/MIT>.
"
" ========
" Includes
" ========

let source_files = [ '~/.vim/common.vim', '~/.vim/plugins.vim', '~/.vim/keymaps.vim', '~/.vim/autocorrect.vim' ]

for path in source_files
    if !empty(glob(path))
        exe 'source' path
    endif
endfor
