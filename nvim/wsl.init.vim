"""
" vim-plug
"""

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gkz/vim-ls'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PProvost/vim-ps1'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()

"""
" Python support
"""
let g:python3_host_prog='/home/paul/.pyenv/shims/python'
" let g:python_host_prog='/home/paul/.pyenv/shims/python'

"""
" deoplete.nvim
"""

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 1)

" fix nvim-typescript
" https://github.com/mhartington/nvim-typescript/issues/115
" call deoplete#custom#option('num_processes', 1)

" complete paths from current buffer directory rather than pwd
call g:deoplete#custom#option('file#enable_buffer_path', 1)

" auto-close scratch on leaving completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"""
" ale
"""

let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_lint_delay = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 0

let g:ale_javascript_flow_use_global = 1

let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\  'javascript.jsx': ['eslint', 'flow']
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"""
" neoformat
"""

let g:neoformat_json_jq = {
  \ 'exe': 'jq',
  \ 'args': ['.', '-S']
\}

let g:neoformat_enabled_json = ['jq']

"""
" vim-airline
"""

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

let g:airline_section_error = "%{exists('*ALEGetStatusLine') ? ALEGetStatusLine() : ''}"

"""
" ctrlp
"""

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nogroup --nocolor --hidden --ignore .git -g ""'
  " let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"""
" tern_for_vim
"""

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent', '--no-port-file']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'javascript.jsx'
\]

"""
" vim-jsx
"""

let g:jsx_ext_required = 0

"""
" ack.vim
""
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore-dir=node_modules --ignore-dir coverage'
endif

"""
" NERDTree
"""
map <C-\> :NERDTreeToggle<CR>
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"""
" vim-better-whitespace
"""
autocmd BufEnter * EnableStripWhitespaceOnSave

"""
" Editor Settings
"""

let g:solarized_termcolors=256

set background=light
syntax enable
colorscheme solarized

set encoding=utf-8
set number
set title

set softtabstop=2
set shiftwidth=2
set expandtab

set incsearch
set hlsearch

set hidden " Hide buffers when switching between them so that you don't have to save each time
set wildmenu
set lazyredraw
set showmatch

set clipboard=unnamed

set completeopt-=preview

set mouse=a

"""
" Highlighting
"""

highlight ALEErrorSign ctermfg=Red ctermbg=LightGrey
highlight ALEWarningSign ctermfg=3 ctermbg=LightGrey
