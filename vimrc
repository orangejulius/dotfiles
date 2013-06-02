set nu

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let go_highlight_trailing_whitespace_error = 0

set pastetoggle=<F10>

set nocompatible               " be iMproved

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-rails.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'airblade/vim-gitgutter'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
" vim-scripts repos
Bundle 'ruby.vim'
Bundle 'Rubytest.vim'
Bundle 'The-NERD-Commenter'
Bundle 'rails.vim'
Bundle 'ctrlp.vim'
Bundle 'endwise.vim'

filetype plugin indent on     " required!
syntax on

set scrolloff=3
set visualbell
set laststatus=2
set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wildmode=longest,list
nnoremap <leader><space> :noh<cr>
" clear whitespace with <leader>W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" easily open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" kill help shortcut
noremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" use hjkl!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" navigate by screen line, not file line
nnoremap j gj
nnoremap k gk

au BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufNewFile,BufRead *.less setf less

au BufNewFile,BufReadPost *.coffee set filetype=coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab softtabstop=2
" replace :W with :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Don't clutter my dirs up with swp and tmp files
set backupdir=~/.tmp,
set directory=~/.tmp,
set undodir=~/.tmp

" open tag definition in vertical split
"nmap <C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" disable by default, but allow enabling ruby code folding
nnoremap <leader>f :let ruby_fold!<cr>
let ruby_fold = 0

" don't auto fold everything when opening a new file
set foldlevelstart=99

" navigate between windows more cleanly
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" CtrlP options
let g:ctrlp_max_depth=10

"colorscheme Tomorrow-Night

" display tab/eol markers
nnoremap <leader>ll :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" easily navigate between tabs
nnoremap <C-u> gT
nnoremap <C-o> gt

set softtabstop=4

au BufNewFile,BufReadPost *.rb set expandtab
au BufNewFile,BufReadPost *.rb set tabstop=2
au BufNewFile,BufReadPost *.rb set softtabstop=2
