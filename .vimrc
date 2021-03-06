" -------------------------------------------------------------------------------
" NeoBundle {{{
"-------------------------------------------------------------------------------
" https://github.com/Shougo/neobundle.vim
" http://vim-users.jp/2011/10/hack238/
set nocompatible "vi互換にしない
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required! 
NeoBundle 'Shougo/neobundle.vim'

" recommended to install
" https://github.com/Shougo/vimproc
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" https://github.com/Shougo/vimproc
NeoBundle 'Shougo/vimshell'
" https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim'

" My Bundles here:
"
"" original repos on github --------------------------------------------------
" ファイラー
" https://github.com/Shougo/vimfiler
NeoBundle 'Shougo/vimfiler'

" 補完候補の自動表示
" https://github.com/Shougo/neocomplcache
NeoBundle 'Shougo/neocomplcache'

" スニペット補完
" https://github.com/Shougo/neocomplcache-snippets-complete
NeoBundle 'Shougo/neocomplcache-snippets-complete'

" コマンドモードをEmacsキーバインドにする
" https://github.com/houtsnip/vim-emacscommandline
NeoBundle 'houtsnip/vim-emacscommandline' 

" ファイルを保存時にシンタックスのチェック
" https://github.com/scrooloose/syntastic
NeoBundle 'scrooloose/syntastic'

" ミニバッファにバッファ一覧を表示
" https://github.com/fholgado/minibufexpl.vim
NeoBundle 'fholgado/minibufexpl.vim'

" バッファを閉じた時、ウィンドウのレイアウトが崩れないようにする
" https://github.com/rgarver/Kwbd.vim
NeoBundle 'rgarver/Kwbd.vim'

" ステータスラインをカスタマイズ
" https://github.com/Lokaltog/vim-powerline
NeoBundle 'Lokaltog/vim-powerline'

" 自分で修正したプラグイン
" https://github.com/tmsanrinsha/vim
NeoBundle 'tmsanrinsha/vim'

"" vim-scripts repos ---------------------------------------------------------
" sudo権限でファイルを開く・保存
" http://www.vim.org/scripts/script.php?script_id=729
NeoBundle 'sudo.vim'

" ヤンクの履歴を選択してペースト
" http://www.vim.org/scripts/script.php?script_id=1234
NeoBundle 'YankRing.vim'

" カラースキーム
" http://www.vim.org/scripts/script.php?script_id=2340
"NeoBundle 'molokai'

"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'

"" non github repos ----------------------------------------------------------
"NeoBundle 'git://git.wincent.com/command-t.git'
"" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


filetype plugin indent on     " required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"}}}


""-------------------------------------------------------------------------------
" 表示 {{{
"-------------------------------------------------------------------------------
set showmode "現在のモードを表示
set showcmd "コマンドを表示
set number
set ruler
set cursorline

" 不可視文字の可視化（Vimテクニックバイブル1-11）
set list listchars=tab:>-,trail:_
" 全角スペースをハイライト
scriptencoding utf-8

augroup highlightIdeograpicSpace
    autocmd!
    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=67 guibg=#465457
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
"}}}


"-------------------------------------------------------------------------------
" タブ・インデント {{{
"-------------------------------------------------------------------------------
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"<Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数
set softtabstop=4
"インデントの各段階に使われる空白の数
set shiftwidth=4
set expandtab
"新しい行のインデントを現在行と同じくする
set autoindent
set smartindent
"}}}


"-------------------------------------------------------------------------------
" ステータスライン {{{
"-------------------------------------------------------------------------------

" 最下ウィンドウにいつステータス行が表示されるかを設定する。
"               0: 全く表示しない
"               1: ウィンドウの数が2以上のときのみ表示
"               2: 常に表示
set laststatus=2

"set statusline=%f%=%m%r[%{(&fenc!=''?&fenc:&enc)}][%{&ff}][%Y][%v,%l]\ %P
"set statusline=%f%=%<%m%r[%{(&fenc!=''?&fenc:&enc)}][%{&ff}][%Y][%v,%l/%L]
"}}}


"-------------------------------------------------------------------------------
" カラースキーム {{{
"-------------------------------------------------------------------------------
" 256色
set t_Co=256

"http://www.vim.org/scripts/script.php?script_id=2340
colorscheme molokai
"let g:molokai_original = 0
"set background=dark
"colorscheme solarized
"}}}


"-------------------------------------------------------------------------------
" Mapping {{{
"-------------------------------------------------------------------------------
set timeout timeoutlen=3000 ttimeoutlen=100

if !has('gui_running')
    " ターミナル上でのメタキーの設定
    set <M-0>=0
    set <M-1>=1
    set <M-2>=2
    set <M-3>=3
    set <M-4>=4
    set <M-5>=5
    set <M-6>=6
    set <M-7>=7
    set <M-8>=8
    set <M-9>=9
    set <M-n>=n
    set <M-p>=p

    " <C-Tab><S-C-Tab>など、ターミナル上で定義されていないキーを設定するためのトリック
    " http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
    " MapFastKeycode: helper for fast keycode mappings
    " makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
    function! <SID>MapFastKeycode(key, keycode)
        if s:fast_i == 46
            echohl WarningMsg
            echomsg "Unable to map ".a:key.": out of spare keycodes"
            echohl None
            return
        endif
        let vkeycode = '<'.(s:fast_i/23==0 ? '' : 'S-').'F'.(15+s:fast_i%23).'>'
        exec 'set '.vkeycode.'='.a:keycode
        exec 'map '.vkeycode.' '.a:key
        let s:fast_i += 1
    endfunction
    let s:fast_i = 0

    call <SID>MapFastKeycode('<C-Tab>', "[27;5;9~")
    call <SID>MapFastKeycode('<S-C-Tab>', "[27;6;9~")
endif

inoremap jj <ESC>
"}}}


"-------------------------------------------------------------------------------
" バッファ {{{
"-------------------------------------------------------------------------------
nnoremap <M-n> :bn<CR>
nnoremap <M-p> :bp<CR>
nnoremap <M-1> :b1<CR>
nnoremap <M-2> :b2<CR>
nnoremap <M-3> :b3<CR>
nnoremap <M-4> :b4<CR>
nnoremap <M-5> :b5<CR>
nnoremap <M-6> :b6<CR>
nnoremap <M-7> :b7<CR>
nnoremap <M-8> :b8<CR>
nnoremap <M-9> :b9<CR>
nnoremap <M-0> :b10<CR>

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" bclose.vim
" バッファを閉じた時、ウィンドウのレイアウトが崩れないようにする
" https://github.com/rgarver/Kwbd.vim
" set hiddenを設定しておく必要あり
if filereadable(expand('~/.vim/bundle/Kwbd.vim/plugin/bclose.vim'))
    nmap <Leader>bd <Plug>Kwbd
endif
"}}}


"-------------------------------------------------------------------------------
" ウィンドウ {{{
"-------------------------------------------------------------------------------
nnoremap <C-w>; <C-w>+
"  常にカーソル行を真ん中に
"set scrolloff=999


"縦分割されたウィンドウのスクロールを同期させる
"同期させたいウィンドウ上で<F12>を押せばおｋ
"解除はもう一度<F12>を押す
"横スクロールも同期させたい場合はこちら
"http://ogawa.s18.xrea.com/fswiki/wiki.cgi?page=Vim%A4%CE%A5%E1%A5%E2
nnoremap <F12> :set scrollbind!<CR>
"}}}


"-------------------------------------------------------------------------------
" タブ {{{
"-------------------------------------------------------------------------------
"  いつタブページのラベルを表示するかを指定する。
"  0: 表示しない
"  1: 2個以上のタブページがあるときのみ表示
"  2: 常に表示
set showtabline=1

nnoremap <C-T>c :tabnew<CR>
nnoremap <C-T>q :tabc<CR>

nnoremap <C-Tab> :tabn<CR>
nnoremap <S-C-Tab> :tabp<CR>

nnoremap <C-T>1  :1tabn<CR>
nnoremap <C-T>2  :2tabn<CR>
nnoremap <C-T>3  :3tabn<CR>
nnoremap <C-T>4  :4tabn<CR>
nnoremap <C-T>5  :5tabn<CR>
nnoremap <C-T>6  :6tabn<CR>
nnoremap <C-T>7  :7tabn<CR>
nnoremap <C-T>8  :8tabn<CR>
nnoremap <C-T>9  :9tabn<CR>
nnoremap <C-T>0  :10tabn<CR>

"}}}


"-------------------------------------------------------------------------------
" コマンドモード {{{
"-------------------------------------------------------------------------------
"set wildmenu "コマンド入力時にTabを押すと補完メニューを表示する

"コマンドモードの補完をシェルコマンドの補完のようにする
"http://vim-jp.org/vimdoc-ja/options.html#%27wildmode%27
set wildmode=list:longest

"前方一致をCtrl+PとCtrl+Nで
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>

set history=100000 "保存する履歴の数
"}}}


"-------------------------------------------------------------------------------
" paste {{{
"-------------------------------------------------------------------------------
"pasteモードのトグル。autoindentをonにしてペーストすると
"インデントが入った文章が階段状になってしまう。
"pasteモードではautoindentが解除されそのままペーストできる
set pastetoggle=<F11>  

"Tera TermなどのBracketed Paste Modeをサポートした端末では
"以下の設定で、貼り付けるとき自動的にpasteモードに切り替えてくれる。
"http://sanrinsha.lolipop.jp/blog/2011/11/%E3%80%8Cvim-%E3%81%8B%E3%82%89%E3%81%AE%E5%88%B6%E5%BE%A1%E3%82%B7%E3%83%BC%E3%82%B1%E3%83%B3%E3%82%B9%E3%81%AE%E4%BD%BF%E7%94%A8%E4%BE%8B%E3%80%8D%E3%82%92screen%E4%B8%8A%E3%81%A7%E3%82%82%E4%BD%BF.html
"if &term =~ "xterm" && v:version > 603
"    "for screen
"    " .screenrcでterm xterm-256colorとしている場合 
"    if &term == "xterm-256color"
"        let &t_SI = &t_SI . "\eP\e[?2004h\e\\"
"        let &t_EI = "\eP\e[?2004l\e\\" . &t_EI
"        let &pastetoggle = "\e[201~"
"    elseif &term == "xterm" 
"        let &t_SI .= &t_SI . "\e[?2004h"  
"        let &t_EI .= "\e[?2004l" . &t_EI
"        let &pastetoggle = "\e[201~" 
"    endif
"
"    function XTermPasteBegin(ret) 
"        set paste 
"        return a:ret 
"    endfunction 
"
"    imap <special> <expr> <Esc>[200~ XTermPasteBegin("") 
"endif
"}}}


"-------------------------------------------------------------------------------
" 検索 {{{
"-------------------------------------------------------------------------------
set incsearch
set ignorecase "検索パターンの大文字小文字を区別しない
set smartcase "検索パターンに大文字を含んでいたら大文字小文字を区別する
set nohlsearch "検索結果をハイライトしない

" ESCキー2度押しでハイライトのトグル
nnoremap <Esc><Esc> :set hlsearch!<CR>

"ヴィビュアルモードで選択した範囲だけ検索
vnoremap <Leader>/ <ESC>/\%V
vnoremap <Leader>? <ESC>?\%V
"}}}
 
 
"-------------------------------------------------------------------------------
" カーソル {{{
"-------------------------------------------------------------------------------
"カーソルを表示行で移動する。
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk
noremap 0 g0
noremap $ g$
 
" backspaceキーの挙動を設定する
" " indent        : 行頭の空白の削除を許す
" " eol           : 改行の削除を許す
" " start         : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start

" <C-u>, <C-w>した文字列をアンドゥできるようにする
" http://vim-users.jp/2009/10/hack81/
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" カーソルを行頭、行末で止まらないようにする。
" http://vimwiki.net/?'whichwrap'
"set whichwrap=b,s,h,l,<,>,[,],~

"カーソルの形状の変化
"http://sanrinsha.lolipop.jp/blog/2011/11/%E3%80%8Cvim-%E3%81%8B%E3%82%89%E3%81%AE%E5%88%B6%E5%BE%A1%E3%82%B7%E3%83%BC%E3%82%B1%E3%83%B3%E3%82%B9%E3%81%AE%E4%BD%BF%E7%94%A8%E4%BE%8B%E3%80%8D%E3%82%92screen%E4%B8%8A%E3%81%A7%E3%82%82%E4%BD%BF.html

"if &term == "xterm-256color" && v:version > 603
"    "let &t_SI .= "\eP\e[3 q\e\\"
"    let &t_SI .= "\eP\e[?25h\e[5 q\e\\"
"    let &t_EI .= "\eP\e[1 q\e\\"
"elseif &term == "xterm" && v:version > 603
"    "let &t_SI .= "\e[3 q"
"    let &t_SI .= "\e[?25h\e[5 q"
"    let &t_EI .= "\e[1 q"
"endif

"set notimeout      " マッピングについてタイムアウトしない
"set ttimeout       " 端末のキーコードについてタイムアウトする
"set timeoutlen=0 " ミリ秒後にタイムアウトする
"set timeout timeoutlen=3000 ttimeoutlen=100

"}}}


"-------------------------------------------------------------------------------
" カッコ・タグの対応 {{{
"-------------------------------------------------------------------------------
set showmatch matchtime=1 "括弧の対応
source $VIMRUNTIME/macros/matchit.vim "HTML tag match
"}}}


"-------------------------------------------------------------------------------
" マウス {{{
"-------------------------------------------------------------------------------
" Enable mouse support.
" Ctrlを押しながらマウスをを使うとmouse=aをセットしてないときの挙動になる
set mouse=a 
 
" For screen. 
" .screenrcでterm xterm-256colorとしている場合 
if &term == "xterm-256color" 
    augroup MyAutoCmd 
        autocmd VimLeave * :set mouse= 
    augroup END 
 
    " screenでマウスを使用するとフリーズするのでその対策 
    " Tere Termだと自動で認識されているかも
    " http://slashdot.jp/journal/514186/vim-%E3%81%A7%E3%81%AE-xterm-%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E3%81%AE%E8%87%AA%E5%8B%95%E8%AA%8D%E8%AD%98
    set ttymouse=xterm2 
endif 

if has('gui_running')
    " Show popup menu if right click.
    set mousemodel=popup

    " Don't focus the window when the mouse pointer is moved.
    set nomousefocus
    " Hide mouse pointer on insert mode.
    set mousehide
endif
"}}}


"-------------------------------------------------------------------------------
" gf(goto file)の設定 {{{
"-------------------------------------------------------------------------------
" http://sanrinsha.lolipop.jp/blog/2012/01/vim%E3%81%AEgf%E3%82%92%E6%94%B9%E8%89%AF%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B.html
" ファイルの検索の範囲の変更
augroup htmlInclude
    autocmd!
    autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','')
augroup END
set path+=./;/
"}}}


"-------------------------------------------------------------------------------
" 文字コード {{{
"-------------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

" ファイルのエンコードの判定を前から順番にする
" ファイルを読み込むときに 'fileencodings' が "ucs-bom" で始まるならば、
" BOM が存在するかどうかが調べられ、その結果に従って 'bomb' が設定される。
" http://vim-jp.org/vimdoc-ja/options.html#%27fileencoding%27
" 以下はVimテクニックバイブル「2-7ファイルの文字コードを変換する」に書いてあるfileencodings。
" ただし2つあるeuc-jpの2番目を消した
if has("win32") || has("win64")
    set fileencodings=iso-2222-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932
else
    " 上の設定はたまに誤判定をするので、UNIX上で開く可能性があるファイルのエンコードに限定
    set fileencodings=ucs-boms,utf-8,euc-jp
endif

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"}}}


"-------------------------------------------------------------------------------
" Syntax {{{
"-------------------------------------------------------------------------------
syntax enable
set foldmethod=marker

" Vimテクニックバイブル1-13
" PHPプログラムの構文チェック
" http://d.hatena.ne.jp/i_ogi/20070321/1174495931
"augroup phpsyntaxcheck
"    autocmd!
"    autocmd FileType php set makeprg=php\ -l\ % | set errorformat=%m\ in\ %f\ on\ line\ %l
"    "autocmd BufWrite *.php w !php -l 2>&1 | sed -e 's/\(.*Errors.*\)/[31m\1[0m/g'
"    autocmd BufWrite *.php w | make
"augroup END
"http://d.hatena.ne.jp/Cside/20110805/p1に構文チェックを非同期にやる方法が書いてある

let php_sql_query=1 " 文字列中のSQLをハイライトする
let php_htmlInStrings=1 " 文字列中のHTMLをハイライトする
let php_noShortTags = 1 " ショートタグ (<?を無効にする→ハイライト除外にする)
let php_folding = 1 " クラスと関数の折りたたみ(folding)を有効にする 
augroup php
    autocmd!
    au Syntax php set foldmethod=syntax
augroup END

"augroup vim
"    autocmd!
"    au Syntax vim set foldmethod=marker
"augroup END

"}}}


"-------------------------------------------------------------------------------
" MySQL {{{
"-------------------------------------------------------------------------------
" Editorの設定
" http://lists.ccs.neu.edu/pipermail/tipz/2003q2/000030.html
augroup mysqlEditor
    autocmd!
    au BufRead /var/tmp/sql* set ft=mysql
augroup END
"}}}
  

"-------------------------------------------------------------------------------
" Manual {{{
"-------------------------------------------------------------------------------
":Man <man>でマニュアルを開く
runtime ftplugin/man.vim
nmap K <Leader>K
"コマンドラインでmanを使ったとき、vimの:Manで見るようにするための設定
"http://vim.wikia.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
".zshrc .bashrc等にも記述が必要
let $PAGER=''
"}}}


"-------------------------------------------------------------------------------
" gVim {{{
"-------------------------------------------------------------------------------
"Windowsのgvimのメニューの文字化け対応
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"}}}


"-------------------------------------------------------------------------------
" vimfiler {{{
"-------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
"}}}

"-------------------------------------------------------------------------------
" sudo.vim {{{
"-------------------------------------------------------------------------------
" sudo権限で保存する
" http://sanrinsha.lolipop.jp/blog/2012/01/sudo-vim.html
"nmap <Leader>e :e sudo:%<CR><C-^>:bd<CR>
"nmap <Leader>w :w sudo:%<CR>
if filereadable(expand('~/.vim/bundle/Kwbd.vim/plugin/bclose.vim'))
    nmap <Leader>e :e sudo:%<CR><C-^><Plug>Kwbd
else
   nnoremap <Leader>e :e sudo:%<CR><C-^>:bd<CR>
endif
nnoremap <Leader>w :w sudo:%<CR>
"}}}


"-------------------------------------------------------------------------------
" yankring.vim {{{
"-------------------------------------------------------------------------------
let g:yankring_manual_clipboard_check = 0
"}}}


"-------------------------------------------------------------------------------
" Mini Buf Explorer {{{
"-------------------------------------------------------------------------------
"let g:miniBufExplSplitBelow=1  " Put new window below
                               " current or on the
                               " right for vertical split
"function! Md()
"    return expand("%:p")
"    "echo "a"
"    "set paste
"endfunction
""let g:statusLineText = "-MiniBufExplorer-" . Md()
"let g:statusLineText = Md()
"}}}


"-------------------------------------------------------------------------------
" Powerline for vim {{{
"-------------------------------------------------------------------------------
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
"let g:Powerline_stl_path_style = 'short'
"}}}


"-------------------------------------------------------------------------------
" neocomplcache {{{
"-------------------------------------------------------------------------------
" setsudo.vimting examples:
if v:version >= 702
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Shell like behavior(my setting)
    " complet_common_stringではsmartcaseが効かない
    " 余計な候補を出して欲しくないので
    " set g:neocomplcache_enable_smart_case = 0と上のほうで設定しておく
    " <TAB>で上で設定したneocomplcache#complete_common_string()を呼び出す
    "imap <expr><TAB>  pumvisible() ? "\<C-l>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    
    


    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
endif
"}}}


if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
