syntax on

set ai
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示

set modifiable
set write

set backupdir=~/.vim/backup
set undodir=~/.vim/undo

set clipboard=unnamed,autoselect

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0 "タブは半角4文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "検索文字列入力時に順次対象文字列にヒットさせない
set hlsearch "検索結果文字列の非ハイライト表示

if has('gui_macvim')
  if has('gui_running')
    set showtabline=2    " タブを常に表示
    set transparency=5   " 透明度
    set guioptions-=T    " ツールバー非表示
    set antialias        " アンチエイリアス
    set tabstop=4        " タブサイズ
    set visualbell t_vb= " ビープ音なし

    set transparency=3
    set lines=50 columns=130

    set guifontwide=Osaka:h12
    set guifont=Osaka-Mono:h14
  endif
endif

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
filetype plugin on
filetype indent on

" Unite
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ul :<C-u>Unite line<CR>

NeoBundle 'Shougo/vimfiler.vim'
nnoremap <silent> ,vf :<C-u>VimFiler<CR>
let g:vimfiler_trashbox_directory = "~/.vim/filer_trash"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" インデントに色付け
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" 補完
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" haskell関連
NeoBundle 'dag/vim2hs'
NeoBundle 'kana/vim-filetype-haskell'
" 型を調べる
NeoBundle 'eagletmt/ghcmod-vim'
" いい感じに補完する
NeoBundle 'ujihisa/neco-ghc'
" いい感じに実行する
NeoBundle 'thinca/vim-quickrun'
" hoogleる
NeoBundle 'thinca/vim-ref'
" importを楽にする
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'ujihisa/ref-hoogle'

" surround
NeoBundle 'tpope/vim-surround'



" dash
NeoBundle 'rizzatti/dash.vim'

NeoBundleCheck


