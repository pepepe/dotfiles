syntax on

set ai
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示

set backupdir=~/.vim/backups
set undodir=~/.vim/undo

set clipboard=unnamed,autoselect

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
    set lines=90 columns=200

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

NeoBundleCheck

