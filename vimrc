set nocompatible               " be iMproved

"
"" Vundle
"
set runtimepath+=~/.vim/bundle/vundle/ " add vundle to runtimepath
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" easily comment out huge swaths of code
Bundle 'The-NERD-Commenter'
" show git line status in the gutter
Bundle 'airblade/vim-gitgutter'
" javascript template syntax highlighting
Bundle 'briancollins/vim-jst'
" use awesome colorscheme
Bundle 'chriskempson/vim-tomorrow-theme'
" run SQL in vim
Bundle 'dbext.vim'
" vim-scripts repos
Bundle 'The-NERD-Commenter'
" awesome searching
Bundle 'ctrlp.vim'
" automatically add ruby end tags
Bundle 'endwise.vim'
" less syntax highlighting
Bundle 'groenewege/vim-less'
" run ruby tests with <Leader>t
Bundle 'janx/vim-rubytest'
" coffeescript syntax highlighting
Bundle 'kchmck/vim-coffee-script'
" text matching (dependency of textobj-rubyblock)
Bundle 'matchit.zip'
" easily create gists
Bundle 'mattn/gist-vim'
" requirement of gist-vim
Bundle 'mattn/webapi-vim'
" javascript syntax highlighting
Bundle 'pangloss/vim-javascript'
" ruby syntax highlighting
Bundle 'ruby.vim'
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

filetype plugin indent on     " required!

syntax on " show syntax highlighting

set gdefault " replace globally by default
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " always show status bar
set number " show line numbers
set pastetoggle=<F10> " use f10 to toggle paste mode
set scrolloff=3
set showmatch
set smartcase
set softtabstop=4
set undofile " use persistent undo in a file
set visualbell " enable visual bell (disable audio bell)
set wildmode=longest,list

nnoremap <leader><space> :noh<cr> " easily clear highlighting
" clear whitespace with <leader>W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" easily open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap / /\v
vnoremap / /\v

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

"theme options
set background=dark
colorscheme Tomorrow-Night-Bright

" display tab/eol markers
nnoremap <leader>ll :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" easily navigate between tabs
nnoremap <C-u> gT
nnoremap <C-o> gt

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

au BufNewFile,BufReadPost *.rb set expandtab
au BufNewFile,BufReadPost *.rb set tabstop=2
au BufNewFile,BufReadPost *.rb set softtabstop=2
au BufNewFile,BufReadPost *.rb set shiftwidth=2
au BufNewFile,BufReadPost *.rb set foldmethod=manual
