" =======
" Plugins
" =======
call plug#begin()
" =======
" General
" =======
" switch to absolute line numbers automatically when relative numbers don't
" make sense
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" command line fuzzy file search and open
Plug 'ctrlpvim/ctrlp.vim'
" pairs of commands
Plug 'tpope/vim-unimpaired'
" work with surrounding quotes/braces/tags
Plug 'tpope/vim-surround'
" close files instead of closing views
Plug 'moll/vim-bbye'
" sidebar file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Comment functions
Plug 'scrooloose/nerdcommenter'
" use vimdiff on folders!
Plug 'will133/vim-dirdiff'
" line up text
Plug 'godlygeek/tabular'

" ======
" Visual
" ======
" colorscheme works nice with iterm2 solarized theme
Plug 'altercation/vim-colors-solarized'
" lightweight alternative to Powerline
Plug 'vim-airline/vim-airline'
" additional themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" ===========
" Programming
" ===========
" sidebar code structure browser, requires exuberant-tags to be installed
Plug 'majutsushi/tagbar'

if v:version < 800
    " auto-complete, supports Jedi for Python code
    Plug 'Shougo/neocomplete' | Plug 'Konfekt/FastFold'
    " code and style checks
    Plug 'scrooloose/syntastic'
else
    " async auto-complete
    Plug 'maralla/completor.vim'
    " async linter
    Plug 'w0rp/ale'
endif

" ===========
" Git Support
" ===========
" the best Git wrapper of all time
Plug 'tpope/vim-fugitive'
" sign column to indicate added, modified and removed lines managed in VCS
Plug 'mhinz/vim-signify'

" ==============
" Python Support
" ==============
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
" Python code completion and refactoring
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" ==========
" Go Support
" ==========
if executable('go')
    Plug 'fatih/vim-go', {'for': 'go'}
endif

" ===============
" Ansible Support
" ===============
Plug 'pearofducks/ansible-vim'

" ==============
" Puppet Support
" ==============
Plug 'rodjek/vim-puppet'

" =========================
" Martup Languages Suppoprt
" =========================
" reStructured text
Plug 'gu-fan/riv.vim', { 'for': 'rst,python' }
" YAML indentation
Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
" YAML folds
Plug 'digitalrounin/vim-yaml-folds', { 'for': 'yaml' }
" Jinja2 template files
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

" =========
" Solarized
" =========
set background=dark
:silent! colorscheme solarized

" =====
" CtrlP
" =====
let g:ctrlp_cmd = 'CtrlPMixed'

" ========
" NERDTree
" ========
map <leader>n :NERDTreeToggle<CR>
" filter on *.pyc files in NERDTree plugin
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
            \ '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

function! StartFileTree()
    " Starts NERDTree for any new window or tab that
    " was started without a specific file.
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartFileTree()
autocmd TabEnter * call StartFileTree()

" =============
" NERDCommenter
" =============
" Use octothorpe for comments in ini/conf files, keep ; as alternative
let g:NERDCustomDelimiters = {
    \ 'dosini': {'left': '#', 'leftAlt': ';'}
    \ }
let g:NERDSpaceDelims = 1

" ======
" Tagbar
" ======
let g:tagbar_width = 32
" Key to toggle TagBar sidebar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_type_puppet = { 'ctagstype': 'puppet',
                           \ 'kinds': [
                                \ 'c:class',
                                \ 's:site',
                                \ 'n:node',
                                \ 'd:definition',
                                \ 'r:resource',
                                \ 'f:default'
                           \ ]}

" =======
" Signify
" =======
let g:signify_vcs_list = [ 'git',]
let g:signify_realtime = 1

" ====
" Jedi
" ====
" Do not use Jedi for autocompletion (using completor/neocomplete for that)
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

" Change default binding of jedi's rename command
let g:jedi#rename_command = "<leader>rn"
" Set function call signatures display
" 0 - turned off
" 1 - pop-up (easier to refer to)
" 2 - vim's command line (nicer undo history)
let g:jedi#show_call_signatures = 1
" Use tabs for go-to commands
let g:jedi#use_tabs_not_buffers = 1

if v:version < 800
" ===========
" Neocomplete
" ===========
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Python / jedi-vim completion
    autocmd FileType python setlocal omnifunc=jedi#completions
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " Other completions (builtin)
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " Key-mappings are in keymaps.vim
else
" =========
" Completor
" =========
    let g:completor_python_binary = '/usr/local/bin/python3'
    " let g:completor_gitcommit_omni_trigger = '([\w.]+)'
endif

" ===========
" Python-mode
" ===========
let g:pymode = 1

" disable some features in favor of Jedi and YCM
let g:pymode_rope = 0
let g:pymode_doc = 0

" trim whitespace on save
let g:pymode_trim_whitespaces = 1
" load some code formatting defaults
let g:pymode_options = 1

" use PEP8-compatible indent
let g:pymode_indent = 1
" use advanced pymode folding
let g:pymode_folding = 1
" use pymode motions
let g:pymode_motion = 1
" use virualenv support
let g:pymode_virtualenv = 1

" use running the code facilities
let g:pymode_run = 1
let g:pymode_run_key = '<leader>r'

" use inserting breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Code checking - disable (use Syntastic for this)
let g:pymode_lint = 0

" Pymode custom syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1

if v:version < 800
" =========
" Syntastic
" =========
    " Define nice error symbols
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'

    " Allways stick found errors to loclist
    let g:syntastic_always_populate_loc_list=1
    " Automatically close and open loclist
    let g:syntastic_auto_loc_list=1
    " Aggregate errors from all checkers
    let g:syntastic_aggregate_errors=1

    " Use flake8 as a sole checker for Python files
    " Available are pep8,pep257,pyflakes,pylint,py3kwarn,python,flake8,pylama
    let g:syntastic_python_checkers = ['flake8']
else
" ===
" ALE
" ===
     let g:airline#extensions#ale#enabled = 1
     let g:ale_sign_error = '✗'
     let g:ale_sign_warning = '⚠'
     let g:ale_open_list = 1
     let g:ale_linters = {'python': ['flake8'],}
     let g:ale_lint_on_insert_leave = 1
     let g:ale_lint_on_text_changed = 'normal'
endif

" ===
" Riv
" ===
" output path for converted file _not_ in projects
let g:riv_temp_path = 0  " the same dir as source

" highlight Python docstrings as RST
let g:riv_python_rst_hl = 1
" use this highlighting (otherwise interferes? with python highlighting)
let g:riv_highlight_code = 'python'
"do not use fixdel
let g:riv_disable_del = 1
