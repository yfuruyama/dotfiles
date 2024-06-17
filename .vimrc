" === Vundle Settings === {{{1
" vundle.vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'https://github.com/gmarik/vundle'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/preservim/nerdcommenter'
Bundle 'https://github.com/jonathanfilip/vim-lucius'
Bundle 'https://github.com/kien/ctrlp.vim.git'
source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on

" === Plugin Settings === {{{1

" colorscheme
set t_Co=256
colorscheme lucius
let g:lucius_style='dark'
syntax on

" NERDTree
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1

" NERDCommenter
nmap <silent> <C-c> <plug>NERDCommenterToggle
vmap <silent> <C-c> <plug>NERDCommenterToggle
let NERDSpaceDelims = 1 " /**/ => /* */ 
let NERDShuntUp = 1 " No warnings for not compatible file type

" CtrlP
" let g:loaded_ctrlp = 1 " to disable ctrlp
let g:ctrlp_map = '<c-j>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<c-i>'],
  \ }

" NERDTree
nmap <silent> <C-e> :NERDTreeToggle<CR>

" golang
let g:go_fmt_command = "goimports"

" Terraform
let g:terraform_fmt_on_save=1

" === Key Mapping === {{{1

" edit and reload .vimrc
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" ^はその行の(空白を除く)先頭に飛ぶコマンド. )はShift+0だから選んだ
nnoremap <silent> ) ^

" ノーマルモードでEnterを押すとその場で改行
nmap <CR> i<CR><ESC>

noremap j gj
noremap k gk
"very magic
" nnoremap / /\v
" nnoremap ? ?\v

" cnoremap s// s//
" cnoremap g// g//
" cnoremap v// v//

" Tab
nnoremap <C-h> gT
nnoremap <C-l> gt

" インサートモード時のカーソル移動(emacs like)
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" インサートモード時にctrl+hで左文字削除
set bs=2
inoremap <C-h> <BS>
" インサートモード時にctrl+dで右文字削除
inoremap <C-d> <Del>

" 0番レジスタをCtrl-Pで貼り付け
vnoremap <silent> <C-p> "0p<CR>

" 切り取った部分を再選択(gvと似ている)
nnoremap <silent> gc `[v`]

" 一つ前の編集場所に移動
nnoremap gb `.zz

" nnoremap <silent> <C-i> :vsp<CR>

"" quickfix 
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
" QuickFixの高さを最適なサイズに調整
au FileType qf call AdjustWindowHeight(2, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" location-list
"map <C-n> :lnext<CR>
"map <C-p> :lprev<CR>

" バッファ
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [B :bf<CR>
nnoremap <silent> ]B :bl<CR>

" コマンド履歴のフィルタリングを<C-p>と<C-n>でも出来るようにする
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" visual search
vmap X y/<C-R>"<CR>

" set mark before starting search
nnoremap / mamA/

" Emacs-like cursor move in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>

" need to disable disable some key mapping of terminal
" cf. $ stty -a
" Ctrl-Qで画面閉じる
nnoremap <C-q> :q<CR>
" Ctrl-Sで保存
nnoremap <C-s> :w<CR>

" === Indent Settings === {{{1

" 新しい行のインデントを現在行と同じにする
set autoindent
" タブの代わりに空白文字を挿入する
set expandtab
" シフト移動幅
set shiftwidth=4
" 行頭の余白内でTabを打ち込むと、shiftwidthの数だけインデントする
set smarttab
" ファイル内で<Tab>をどれくらいの表示幅(空白の数)にするか
set tabstop=4
" 新しい行を作った時に高度な自動インデントを行う
"set smartindent



" === File Type Settings === {{{1
augroup filetype_settings
    autocmd!
    " Python
    autocmd FileType python setl expandtab copyindent preserveindent softtabstop=0 tabstop=4 shiftwidth=4

    " C
    autocmd FileType c setl tabstop=4 expandtab shiftwidth=4

    " C++
    autocmd FileType cpp setl tabstop=2 expandtab shiftwidth=2

    " Ruby
    autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2

    " Perl
    autocmd BufNewFile,BufRead *.psgi set ft=perl
    autocmd BufNewFile,BufRead *.t set ft=perl
    autocmd BufNewFile,BufRead cpanfile set ft=perl
    autocmd BufNewFile,BufRead *.tt set ft=tt2
    autocmd BufNewFile,BufRead Daikufile set ft=perl
    autocmd FileType perl setl tabstop=4 expandtab shiftwidth=4
    " necessary for using ctags
    autocmd FileType perl set iskeyword+=:

    " HTML
    autocmd FileType html setl tabstop=2 expandtab shiftwidth=2
    autocmd FileType xhtml setl tabstop=2 expandtab shiftwidth=2
    autocmd FileType htmldjango setl tabstop=2 expandtab shiftwidth=2
    autocmd BufNewFile,BufRead *.tx set ft=html
    autocmd BufNewFile,BufRead *.tt set ft=html

    " CSS, SCSS
    autocmd FileType css setl tabstop=2 expandtab shiftwidth=2
    autocmd FileType scss.css setl tabstop=2 expandtab shiftwidth=2

    " JavaScript
    autocmd FileType javascript setl tabstop=2 expandtab shiftwidth=2
    " .jsonファイルをjavascriptのsyntax highlightingにさせる
    autocmd BufNewFile,BufRead *.json set ft=javascript

    " Objective-c
    autocmd BufNewFile,BufRead *.m set ft=objc

    " MySQL
    autocmd BufNewFile,BufRead *.sql set ft=mysql

    " Config
    autocmd BufNewFile,BufRead *.cnf set ft=conf

    " YAML
    autocmd FileType yaml setl tabstop=2 expandtab shiftwidth=2

augroup END

" Golang
if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
endif

" === MISC === {{{1

" 言語
lang en_US

set nu
" Shift-oを素早く認識させるために必要
set ttimeoutlen=10
" ステータスラインを常に表示
set laststatus=2
" ステータスライン表示設定
highlight statusline term=NONE cterm=NONE ctermbg=black ctermfg=white
set incsearch
set ignorecase
set smartcase
set cursorline
set virtualedit=block
set foldmethod=marker
set noswapfile

if version >= 703
    " undo履歴をファイルに保存
    set undofile
    " undo履歴ファイルを以下のディレクトリに保存
    set undodir=$HOME/.vim/undodir
endif

" コマンドの履歴を200個に
set history=200

" 下に表示されるメニューでコマンドライン補完
set wildmenu

" 不可視文字の表示
set list
set listchars=tab:>\ ,eol:\ ,trail:\ 
" 色はdarkgrayに
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

" :e.でファイラとして開いたときにツリー形式に表示する
let g:netrw_liststyle=3

" 検索結果に色をつける
:set hlsearch
" ESCキー連打で検索結果でついた色を消す
:nmap <Esc><Esc> :nohlsearch<CR><Esc>

" エンコーディング
:set encoding=utf-8
:set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" makeした後に自動でQuickFixを開く
autocmd QuickfixCmdPost make copen
" Perl Document
:nnoremap <buffer> <silent> _f :!perldoc -f <cword><Enter>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

let g:markdown_fenced_languages = [
\   'perl',
\   'python',
\   'ruby',
\   'javascript',
\   'js=javascript',
\   'json=javascript',
\   'mysql',
\   'sh',
\]
