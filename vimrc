set nocompatible               " be iMproved

"" Vundle
set runtimepath+=~/.vim/bundle/vundle/ " add vundle to runtimepath
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"" vim-scripts repos

" easily comment out huge swaths of code
Bundle 'The-NERD-Commenter'
" show git line status in the gutter
Bundle 'airblade/vim-gitgutter'
" javascript template syntax highlighting
Bundle 'briancollins/vim-jst'
" use awesome colorscheme
Bundle 'chriskempson/vim-tomorrow-theme'
" allow easy navigation between vim/tmux splits
Bundle 'christoomey/vim-tmux-navigator'
" awesome searching
Bundle 'ctrlp.vim'
" run SQL in vim
Bundle 'dbext.vim'
" scala syntax
Bundle 'derekwyatt/vim-scala'
" automatically add ruby end tags
Bundle 'endwise.vim'
" less syntax highlighting
Bundle 'groenewege/vim-less'
" run ruby tests with <Leader>t
Bundle 'janx/vim-rubytest'
" seoul colors!
Bundle 'junegunn/seoul256.vim'
" coffeescript syntax highlighting
Bundle 'kchmck/vim-coffee-script'
" text matching (dependency of textobj-rubyblock)
Bundle 'matchit.zip'
" easily create gists
Bundle 'mattn/gist-vim'
" requirement of gist-vim
Bundle 'mattn/webapi-vim'
" Ack plugin
Bundle 'mileszs/ack.vim'
" javascript syntax highlighting
Bundle 'pangloss/vim-javascript'
" ruby syntax highlighting
Bundle 'ruby.vim'
" slim syntax highlighting
Bundle 'slim-template/vim-slim'
" improve text selection abilities (dependency of textobj-rubyblock)
Bundle 'textobj-user'
" easily select ruby blocks
Bundle 'textobj-rubyblock'
" Bundler (the rubygem) integration
Bundle 'tpope/vim-bundler'
" great in-vim interface to git (Gblame, etc)
Bundle 'tpope/vim-fugitive'
" rails syntax highlighting
Bundle 'tpope/vim-rails'
" allow you to rename the current file with :rename
Bundle 'vim-scripts/Rename2'

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
set softtabstop=4
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

" navigate between windows more cleanly
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CtrlP options
let g:ctrlp_max_depth=10
let g:ctrlp_max_height = 30
let g:ctrlp_use_caching = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" use silver searcher for ack
let g:ackprg = 'ag --nogroup --nocolor --column'

map <leader>a :Ack!<space>

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

" set up rubytest to use spork for full files
" a bug in running single tests prevents changing that for now
let g:rubytest_cmd_test = "testdrb_or_ruby -Itest %p" " https://gist.github.com/7015069

""" Settings for various filetypes

au BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufNewFile,BufRead *.less setf less

au BufNewFile,BufReadPost *.coffee set filetype=coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab softtabstop=2

au BufNewFile,BufReadPost *.rb set expandtab
au BufNewFile,BufReadPost *.rb set tabstop=2
au BufNewFile,BufReadPost *.rb set softtabstop=2
au BufNewFile,BufReadPost *.rb set shiftwidth=2
au BufNewFile,BufReadPost *.rb set foldmethod=manual
