" === Vundle Settings === {{{1
" vundle.vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/gmarik/vundle'
" Bundle 'git://github.com/jsx/jsx.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'
" Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
" Bundle 'git://github.com/y-uuki/syntastic-local-lib-path.vim.git'
Bundle 'git://github.com/thinca/vim-quickrun.git'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://github.com/Shougo/neosnippet.git'
Bundle 'git://github.com/Shougo/neosnippet-snippets.git'
" Bundle 'git://github.com/Rip-Rip/clang_complete.git'
Bundle 'git://github.com/mattn/emmet-vim.git'
" Bundle 'git://github.com/mattn/zencoding-vim.git'
Bundle 'git://github.com/jonathanfilip/vim-lucius'
Bundle 'git://github.com/tpope/vim-fugitive.git'

Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
" Bundle 'git://github.com/kana/vim-fakeclip.git'
Bundle 'git://github.com/thinca/vim-ref.git'
" Bundle 'git://github.com/dag/vim2hs.git'
Bundle 'git://github.com/tpope/vim-markdown.git'
Bundle 'git://github.com/thinca/vim-localrc'
Bundle 'git://github.com/aklt/plantuml-syntax'
" Bundle 'git://github.com/Shougo/vimproc.vim.git'
" Bundle 'git://github.com/Shougo/vimshell.vim.git'
" Bundle 'git://github.com/Lokaltog/powerline.git'
" Bundle 'git://github.com/kingbin/vim-arduino.git'
" Bundle 'https://github.com/vim-scripts/Align.git'
" Bundle 'git://github.com/kana/vim-textobj-user.git'
" Bundle 'git://github.com/kana/vim-textobj-entire.git'
" Bundle 'mhinz/vim-startify.git'
" Bundle 'https://github.com/vim-scripts/YankRing.vim.git'
" python
Bundle 'https://github.com/nvie/vim-flake8.git'
Bundle 'gtags.vim'
Bundle 'a.vim'
" Bundle 'haskell.vim'
Bundle 'taglist.vim'
Bundle 'motemen/xslate-vim'
Bundle 'JulesWang/css.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'toyamarinyon/vim-swift'
Bundle 'fatih/vim-go'
Bundle 'git://github.com/leafgarland/typescript-vim'
source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on



" === Plugin Settings === {{{1

" colorscheme
set t_Co=256
colorscheme lucius
let g:lucius_style='dark'
syntax on

" NERDCommenter
let NERDSpaceDelims = 1 " /**/ => /* */ 
let NERDShuntUp = 1 " No warnings for not compatible file type

" NERDTree
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1

"" quickrun.vim
let g:quickrun_config={'*': {'split': ''}}
" quickrun for markdown
let g:quickrun_config.markdown = {
    \ 'outputter': 'null',
    \ 'command': 'open',
    \ 'cmdopt': '-a',
    \ 'args': 'Marked',
    \ 'exec': '%c %o %a %s',
    \ }
let g:quickrun_config.javascript = {
    \   "command": "node",
    \   "tempfile": "{tempname()}.js"
    \ }
let g:quickrun_config.perl = {
    \   "command": "perl",
    \   "cmdopt": "-Ilib"
    \ }
set splitbelow

" shormarks.vim
:let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['perl'],
                           \ 'passive_filetypes': ['javascript'] }
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl', 'podchecker']
" let g:syntastic_perl_lib_path = '/path/to/carton/local/lib/'
let g:syntastic_perl_lib_path = "local/lib/perl5, lib, t/lib"
" See => http://qiita.com/yuku_t/items/abfb9f2664ee0a93b82e
let g:syntastic_auto_loc_list = 1 " エラーが出た時にQuickFixを立ち上げる
let g:syntasitc_javascript_checker = 'jshint'

" GNU global
nnoremap <C-g><C-j> :GtagsCursor<CR>
nnoremap <C-g><C-h> :Gtags -f %<CR>
nnoremap <C-g><C-g> :Gtags -g <C-r><C-w><CR>
" nnoremap <C-g><C-g> :Gtags 
" nnoremap <C-g><C-g> :Gtags -g <C-r><C-w><CR> :cclose <CR>
" nnoremap <C-g><C-j> :Gtags <C-r><C-w><CR>

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/dotfiles/dict/perl.dict'
    \ }

" Perlの名前空間を表す'::'をデリミタにしない
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['perl'] = []

" for snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $HOME . "/dotfiles/snippets"
imap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Neocomplcache and clang_complete
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0

" Neocomplcache and Golang
" if !exists('g:neocomplcache_omni_patterns')
    " let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'

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

" NERDCommenter
nmap <silent> <C-c> <plug>NERDCommenterToggle
vmap <silent> <C-c> <plug>NERDCommenterToggle

" taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

" vimshell
" nnoremap <silent> ,is :VimShell<CR>
" nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" vmap <silent> ,ss :VimShellSendString<CR>
" nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

" vim-flake8
" autocmd FileType python nnoremap <silent> <C-l> :call Flake8()<CR>
autocmd FileType python autocmd BufWritePre *.py call Flake8()
" let g:flake8_ignore="E123"

" vim-startify
" highlight StartifyHeader ctermfg=lightgreen
" " cf.) http://patorjk.com/software/taag/
" let g:startify_custom_header = [
            " \ '        __   __           _    _ _         ',
            " \ '        \ \ / /   _ _   _| | _(_| )___     ',
            " \ '         \ V / | | | | | | |/ / |// __|    ',
            " \ '          | || |_| | |_| |   <| | \__ \    ',
            " \ '          |_| \__,_|\__,_|_|\_\_| |___/    ',
            " \ '        __     ___             _____ _____ ',
            " \ '        \ \   / (_)_ __ ___   |___  |___ / ',
            " \ '         \ \ / /| | `_ ` _ \     / /  |_ \ ',
            " \ '          \ V / | | | | | | |   / /  ___) |',
            " \ '           \_/  |_|_| |_| |_|  /_(_)|____/ ',
            " \ '',
            " \ '',
            " \ ]

" vim-ref
let g:ref_perldoc_cmd = 'perldoc_with_carton'
" perldocのドキュメントとソースコードをsで切り替える
augroup vimrc-plugin-ref
  autocmd!
  autocmd FileType ref nnoremap <silent> <buffer> <expr> s
  \ b:ref_source ==# 'perldoc' ?
  \ (b:ref_perldoc_mode ==# 'module' ? ":\<C-u>Ref perldoc -m " .
  \                                b:ref_perldoc_word . "\<CR>" :
  \  b:ref_perldoc_mode ==# 'source' ? ":\<C-u>Ref perldoc " .
  \                                b:ref_perldoc_word . "\<CR>" :
  \ 's') : 's'
augroup END

" golang
let g:go_fmt_command = "goimports"

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

" Automatic interpolation of package directive
" copied from Kan's .vim.rc
function! s:pm_template()
    let fullpath = expand('%:p')
    let path = substitute(fullpath, '.*lib/', '', 'g')
    let module_path = substitute(path, '[\\/]', '::', 'g')
    let module_name = substitute(module_path, '\.pm$', '', 'g')
    call append(0, 'package ' . module_name . ';')
    call append(1, '')
    call append(2, '')
    call append(3, '')
    call append(4, '1;')
    call cursor(3, 0)
endfunction
autocmd BufNewFile *.pm call s:pm_template()

" Golang
if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
endif

" === MISC === {{{1

" 言語
lang en_US

" colorscheme default
" colorscheme evening
" colorscheme koehler

" 行番号表示
set nu
" Shift-oを素早く認識させるために必要
set ttimeoutlen=10
" ステータスラインを常に表示
set laststatus=2
" ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%y%{'\ \ \/'.(&fenc!=''?&fenc:&enc).'\/'.&ff.'\/'}\ \ %{fugitive#statusline()}%=%l,%c%V%8P
highlight statusline term=NONE cterm=NONE ctermbg=black ctermfg=white
" インクリメンタルサーチ
set incsearch
" 検索で大文字小文字を区別しない
set ignorecase
" 大文字小文字の区別をスマートに
set smartcase
" 現在行をラインで表示
set cursorline
" 80行目にライン
" set colorcolumn=80

" 矩形ビジュアルモードで文字のないところにもカーソルを移動できる
set virtualedit=block

set foldmethod=marker

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

" クリップボードをOSと連携
" set clipboard=unnamed,autoselect

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

" .swpファイルを作らない
set noswapfile
