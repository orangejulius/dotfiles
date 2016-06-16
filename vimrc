set nocompatible               " be iMproved
filetype off

"" Vundle
set runtimepath+=~/.vim/bundle/vundle " add vundle to runtimepath
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

"" vim-scripts repos

" easily comment out huge swaths of code
Plugin 'The-NERD-Commenter'
" show git line status in the gutter
Plugin 'airblade/vim-gitgutter'
" allow easy navigation between vim/tmux splits
Plugin 'christoomey/vim-tmux-navigator'
" awesome searching
Plugin 'ctrlp.vim'
" less syntax highlighting
Plugin 'groenewege/vim-less'
" transparently handle GPG encrypted files
Plugin 'jamessan/vim-gnupg'
" run ruby tests with <Leader>t
Plugin 'janx/vim-rubytest'
" seoul colors!
Plugin 'junegunn/seoul256.vim'
" coffeescript syntax highlighting
Plugin 'kchmck/vim-coffee-script'
" text matching (dependency of textobj-rubyblock)
Plugin 'matchit.zip'
" easily create gists
Plugin 'mattn/gist-vim'
" requirement of gist-vim
Plugin 'mattn/webapi-vim'
" Ack plugin
Plugin 'mileszs/ack.vim'
" javascript syntax highlighting
Plugin 'pangloss/vim-javascript'
" ruby syntax highlighting
Plugin 'ruby.vim'
" undo tree!
Plugin 'sjl/gundo.vim'
" slim syntax highlighting
Plugin 'slim-template/vim-slim'
" improve text selection abilities (dependency of textobj-rubyblock)
Plugin 'textobj-user'
" easily select ruby blocks
Plugin 'textobj-rubyblock'
" Elixir lang syntax highlighting
Plugin 'elixir-lang/vim-elixir'
" great in-vim interface to git (Gblame, etc)
Plugin 'tpope/vim-fugitive'
" rails syntax highlighting
Plugin 'tpope/vim-rails'
" allow you to rename the current file with :rename
Plugin 'vim-scripts/Rename2'

call vundle#end()
filetype plugin indent on     " required!

syntax on " show syntax highlighting

set gdefault " replace globally by default
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " always show status bar
set nofoldenable " disable code folding
set number " show line numbers
set pastetoggle=<F10> " use f10 to toggle paste mode
set scrolloff=3
set showmatch
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set undofile " use persistent undo in a file
set visualbell " enable visual bell (disable audio bell)
set wildmode=longest,list "use bash-like autocomplete

map <leader><space> :noh<cr> " easily clear highlighting

" new vsplit with <leader>v
map <leader>v :vsplit<CR>

" clear whitespace with <leader>W
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" easily open vimrc
map <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" auto insert \v before search strings
map / /\v

" kill help shortcut
map <F1> <ESC>

" use hjkl!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" navigate by screen line, not file line
map j gj
map k gk

" replace :W with :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Don't clutter my dirs up with swp and tmp files
set backupdir=~/.tmp,
set directory=~/.tmp,
set undodir=~/.tmp

" open tag definition in vertical split
"nmap <C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" allow mapping <C-j> to things, instead of generating a linefeed
let g:C_Ctrl_j = 'off'

" CtrlP options
let g:ctrlp_max_depth=10
let g:ctrlp_max_height = 30
let g:ctrlp_use_caching = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" use silver searcher for ack
let g:ackprg = 'ag --nogroup --nocolor --column'

map <leader>a :Ack!<space>

" gist-vim
let g:gist_post_private = 1

"theme options
set background=dark
let g:seoul256_background = 233
colorscheme seoul256

" display tab/eol markers
map <leader>ll :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" easily navigate between tabs
map <C-u> gT
map <C-o> gt

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" disable Go syntax highlighting's trailing whitespace
" (it conflicts with the above)
let go_highlight_trailing_whitespace_error = 0

""" Settings for various filetypes

au BufNewFile,BufRead Guardfile set filetype=ruby

au BufNewFile,BufRead *.coffee setl shiftwidth=2 expandtab softtabstop=2

au BufNewFile,BufRead *.rb setl expandtab tabstop=2 softtabstop=2 shiftwidth=2

au BufNewFile,BufRead *.js setl expandtab tabstop=2 softtabstop=2 sw=2

au BufNewFile,BufRead *.md setf markdown " override the default of Modula2
" which is probably not what we want

au BufRead /tmp/mutt-* set tw=72
