" General settings
set nocompatible
set hidden

" allow external vimrc
set exrc

let g:python3_host_prog = pyenv#path('neovim')

" Setup plugins
call plug#begin()

" Defaults
Plug 'tpope/vim-sensible'

" Basic usage
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Styling
Plug 'altercation/vim-colors-solarized'

" General Usability
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'roxma/vim-tmux-clipboard'

" Development
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'jpalardy/vim-slime'
Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets'
Plug 'dcampos/nvim-snippy'

" Language Specific
Plug 'supercollider/scvim', { 'for': 'supercollider' }

" My Plugins
" Plug '~/src/improviz-vim', { 'for': 'improviz' }
" Plug '~/src/glacier/vim', { 'for': 'grains' }
" Plug '~/src/cheapsound/clients/cheapsound.vim', { 'for': 'cheapsound' }

" Add plugins to &runtimepath
call plug#end()

" Display settings
set number
set ruler
set shortmess+=I

set updatetime=300

" Turn mouse mode on
set mouse=a

" Turn alert bells off
set noerrorbells t_vb=
set visualbell

" Turns off swap files and backups
set nobackup
set nowritebackup
set noswapfile

" Turn off folding
set nofoldenable

" Actual formatting options
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Spell check
set spelllang=en_gb

" Search settings
set incsearch
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Colorscheme settings
set background=dark
colorscheme solarized

" Key mappings
" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

command Cheats :help cheats.txt

" Map leader to easier to use key
let mapleader = ","

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Split settings
set splitbelow
set switchbuf=vsplit
set splitright

" File nav settings

nnoremap <leader>f :Lexplore<CR>
nnoremap <leader>r :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Ack!<Space>

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Slime settings
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": "{down-of}"}


imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

" ALE settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }

set secure
