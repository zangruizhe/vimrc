" let use_plugin="false"
let use_plugin="true"

" Get running OS
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "unix"
    endif
  endif
endfunction

let os=GetRunningOS()


"" 关闭兼容模式
set nocompatible              " be iMproved, required
filetype off                  " required


if use_plugin=="true"
  """"""""""plugin config begin"""""""""""""""""""""
  if os=="win"
    " set the runtime path to include Vundle and initialize
    """"""""""" for windows"""""""""""""""""
    set rtp+=$vim/vimfiles/bundle/Vundle.vim/
    let path='$vim/vimfiles/bundle'
    call vundle#begin(path)
    """"""""""""""""""""""""""""""""""""""""
  else
    """""""""""" for linux"""""""""""""""""""""""""""""
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
      echo "Installing Vundle.."
      echo ""
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      let iCanHazVundle=0
    endif

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    """""""""""""""""""""""""""""""""""""""""""""""""""
  endif


  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " " plugin on GitHub repo
  " Plugin 'tpope/vim-fugitive'
  Plugin 'derekwyatt/vim-protodef'
  Plugin 'vim-scripts/FSwitch'
  " Plugin 'bling/vim-airline'
  Plugin 'vim-scripts/winmanager'

  " " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " " Git plugin not hosted on GitHuhttps://github.com/nathanaelkane/vim-indent-guides.gitb
  " Plugin 'git://git.wincent.com/command-t.git'
  Plugin 'https://github.com/altercation/vim-colors-solarized.git'
  Plugin 'https://github.com/vim-scripts/a.vim.git'
  Plugin 'https://github.com/zangruizhe/cpp.vim.git'
  " Plugin 'https://github.com/Mizuchi/STL-Syntax.git'
  Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
  Plugin 'https://github.com/derekwyatt/vim-scala.git'
  Plugin 'https://github.com/vim-scripts/ctags.vim.git'
  Plugin 'https://github.com/scrooloose/nerdtree.git'
  Plugin 'https://github.com/vim-scripts/taglist.vim.git'
  Plugin 'https://github.com/vim-scripts/indexer.tar.gz.git'
  Plugin 'https://github.com/vim-scripts/DfrankUtil.git'
  Plugin 'https://github.com/vim-scripts/vimprj.git'
  Plugin 'https://github.com/majutsushi/tagbar.git'
  Plugin 'https://github.com/dyng/ctrlsf.vim.git'
  " Plugin 'https://github.com/SirVer/ultisnips.git'
  " Plugin 'https://github.com/honza/vim-snippets.git'
  " Plugin 'https://github.com/fholgado/minibufexpl.vim.git'
  " Plugin 'https://github.com/salinasv/vim-vhdl.git'
  " Plugin 'https://github.com/vim-scripts/VHDL-indent-93-syntax.git'
  " Plugin 'https://github.com/Valloric/YouCompleteMe.git'

  " " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " " The sparkup vim script is in a subdirectory of this repo called vim.
  " " Pass the path to set the runtimepath properly.
  " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " " Avoid a name conflict with L9
  " Plugin 'user/L9', {'name': 'newL9'}

  " All of your Plugins must be added before the following line

  if os!="win"
    " link snippets
    let UltiSnips_link=expand('~/.vim/UltiSnips/cpp.snippets')
    let UltiSnips_vim=expand('~/.vim/bundle/ultisnips/autoload/UltiSnips.vim')
    if !filereadable(UltiSnips_link)
      if filereadable(UltiSnips_vim)
        echo "Link snippets for UltiSnips..."
        echo ""
        silent !ln -s ~/.vim/bundle/vim-snippets/snippets ~/.vim/UltiSnips
      endif
    endif

  endif

  call vundle#end()            " required
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
  "
  "
  "

  """"""""""racer_config_start"""""""""""""""""""""
  "" 更新时间：2015-01-18 21:30:31
  "
  "" 定义快捷键的前缀，即 <Leader>
  let mapleader=";"
  "

  " updata plugin
  nmap <Leader>up :PluginInstall<CR>

  "" 缩进可视化插件 Indent Guides
  "" 随 vim 自启动
  let g:indent_guides_enable_on_vim_startup=0
  "" 从第二层开始可视化显示缩进
  let g:indent_guides_start_level=2
  "" 色块宽度
  let g:indent_guides_guide_size=1
  "" 快捷键 i 开/关缩进可视化
  nmap <silent> <Leader>i <Plug>IndentGuidesToggle
  "
  "" <<
  "
  "" >>
  "" 代码折叠
  "
  "" 基于缩进或语法进行代码折叠
  ""set foldmethod=indent
  set foldmethod=syntax
  "" 启动 vim 时关闭折叠代码
  set nofoldenable
  "
  "" <<
  "
  "" >>
  "" 接口与实现快速切换
  "
  "" *.cpp 和 *.h 间切换
  "nmap <Leader>ch :A<CR>
  "" 子窗口中显示 *.cpp 或 *.h
  "nmap <Leader>sch :AS<CR>
  "
  "" <<
  "
  "" >>
  "" 代码收藏
  "
  "" 自定义 vim-signature 快捷键
  "let g:SignatureMap = {
  "        \ 'Leader'             :  "m",
  "        \ 'PlaceNextMark'      :  "m,",
  "        \ 'ToggleMarkAtLine'   :  "m.",
  "        \ 'PurgeMarksAtLine'   :  "m-",
  "        \ 'DeleteMark'         :  "dm",
  "        \ 'PurgeMarks'         :  "mda",
  "        \ 'PurgeMarkers'       :  "m<BS>",
  "        \ 'GotoNextLineAlpha'  :  "']",
  "        \ 'GotoPrevLineAlpha'  :  "'[",
  "        \ 'GotoNextSpotAlpha'  :  "`]",
  "        \ 'GotoPrevSpotAlpha'  :  "`[",
  "        \ 'GotoNextLineByPos'  :  "]'",
  "        \ 'GotoPrevLineByPos'  :  "['",
  "        \ 'GotoNextSpotByPos'  :  "mn",
  "        \ 'GotoPrevSpotByPos'  :  "mp",
  "        \ 'GotoNextMarker'     :  "[+",
  "        \ 'GotoPrevMarker'     :  "[-",
  "        \ 'GotoNextMarkerAny'  :  "]=",
  "        \ 'GotoPrevMarkerAny'  :  "[=",
  "        \ 'ListLocalMarks'     :  "ms",
  "        \ 'ListLocalMarkers'   :  "m?"
  "        \ }
  "
  "" <<
  "
  "" >>
  "" 代码导航
  " 
  "" 基于标签的代码导航
  "
  "" 设置插件 indexer 调用 ctags 的参数
  "" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
  "" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
  let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

  " 正向遍历同名标签
  nmap <Leader>tn :tnext<CR>
  " 反向遍历同名标签
  nmap <Leader>tp :tprevious<CR>

  " 基于语义的代码导航

  "nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
  " 只能是 #include 或已打开的文件
  "nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

  " <<

  "" >>
  "" 标签列表
  "
  " 设置 tagbar 子窗口的位置出现在主编辑区的左边
  let tagbar_left=0
  " 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list
  nnoremap <Leader>tl :TagbarToggle<CR>
  " 设置标签子窗口的宽度
  let tagbar_width=32
  " tagbar 子窗口中不显示冗余帮助信息
  let g:tagbar_compact=1
  " 设置 ctags 对哪些代码元素生成标签
  "let g:tagbar_type_cpp = {
  "     \ 'ctagstype' : 'c++',
  "     \ 'kinds'     : [
  "         \ 'd:macros:1',
  "         \ 'g:enums',
  "         \ 't:typedefs:0:0',
  "         \ 'e:enumerators:0:0',
  "         \ 'n:namespaces',
  "         \ 'c:classes',
  "         \ 's:structs',
  "         \ 'u:unions',
  "         \ 'f:functions',
  "         \ 'm:members:0:0',
  "         \ 'v:global:0:0',
  "         \ 'x:external:0:0',
  "         \ 'l:local:0:0'
  "     \ ],
  "     \ 'sro'        : '::',
  "     \ 'kind2scope' : {
  "         \ 'g' : 'enum',
  "         \ 'n' : 'namespace',
  "         \ 'c' : 'class',
  "         \ 's' : 'struct',
  "         \ 'u' : 'union'
  "     \ },
  "     \ 'scope2kind' : {
  "         \ 'enum'      : 'g',
  "         \ 'namespace' : 'n',
  "         \ 'class'     : 'c',
  "         \ 'struct'    : 's',
  "         \ 'union'     : 'u'
  "     \ }
  "\ }
  "
  "" <<
  "
  "" >>
  "" 查找
  "
  " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
  " nnoremap <Leader>sp :CtrlSF<CR>

  " <<

  "" >>
  "" 替换
  "
  "" 替换函数。参数说明：
  "" confirm：是否替换前逐一确认
  "" wholeword：是否整词匹配
  "" replace：被替换字符串
  "function! Replace(confirm, wholeword, replace)
  "    wa
  "    let flag = ''
  "    if a:confirm
  "        let flag .= 'gec'
  "    else
  "        let flag .= 'ge'
  "    endif
  "    let search = ''
  "    if a:wholeword
  "        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
  "    else
  "        let search .= expand('<cword>')
  "    endif
  "    let replace = escape(a:replace, '/\&~')
  "    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
  "endfunction
  "" 不确认、非整词
  "nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
  "" 不确认、整词
  "nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
  "" 确认、非整词
  "nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
  "" 确认、整词
  "nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
  "nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
  "
  "" <<
  "
  " 模板补全
  " UltiSnips 的 tab 键与 YCM 冲突，重新设定
  "let g:UltiSnipsSnippetDir=["/data1/zangruizhe/.vim/mysnippets"]
  "let g:UltiSnipsEnableSnipMate=0
  let g:UltiSnipsSnippetDirectories=["mysnippets"]
  "let g:UltiSnipsExpandTrigger="<leader><tab>"
  let g:UltiSnipsExpandTrigger="<c-e>"
  let g:UltiSnipsJumpForwardTrigger="<c-r>"
  let g:UltiSnipsJumpBackwardTrigger="<c-l>"
  let g:UltiSnipsUsePythonVersion=2
  " >>
  " YCM 补全
  "
  " YCM 补全菜单配色
  " 菜单
  highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
  " 选中项
  highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

  " 补全功能在注释中同样有效
  let g:ycm_complete_in_comments=1

  " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
  let g:ycm_confirm_extra_conf=0

  " 开启 YCM 标签补全引擎
  let g:ycm_collect_identifiers_from_tags_files=1
  " 引入 C++ 标准库 tags
  set tags+=/data/misc/software/app/vim/stdcpp.tags

  " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
  inoremap <leader>; <C-x><C-o>

  " 补全内容不以分割子窗口形式出现，只显示补全列表
  set completeopt-=preview

  " 从第一个键入字符就开始罗列匹配项
  let g:ycm_min_num_of_chars_for_completion=1

  " 禁止缓存匹配项，每次都重新生成匹配项
  let g:ycm_cache_omnifunc=0

  " 语法关键字补全
  let g:ycm_seed_identifiers_with_syntax=1

  " <<
  " 
  "" 静态分析器 syntastic 错误标识
  "let g:syntastic_error_symbol = '✗'
  "let g:syntastic_warning_symbol = '⚠'
  "
  " >>
  " 由接口快速生成实现框架
  "
  " to complate *.cc by *.h
  nmap <buffer> <silent> <leader> ,PP
  " 设置 pullproto.pl 脚本路径
  let g:protodefprotogetter='$vim/vimfiles/bundle/vim-protodef/pullproto.pl'

  " 成员函数的实现顺序与声明顺序一致
  let g:disable_protodef_sorting=1

  " <<
  "
  "" >>
  "" 库信息参考
  " 
  "" 启用:Man命令查看各类man信息
  "source $VIMRUNTIME/ftplugin/man.vim
  "
  "" 定义:Man命令查看各类man信息的快捷键
  "nmap <Leader>man :Man 3 <cword><CR>
  "
  "" <<
  "
  "" >>
  "" 工程文件浏览
  "
  " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
  nmap <Leader>fl :NERDTreeToggle<CR>
  " 设置 NERDTree 子窗口宽度
  let NERDTreeWinSize=30
  "" 设置 NERDTree 子窗口位置
  let NERDTreeWinPos="left"
  "" 显示隐藏文件
  let NERDTreeShowHidden=1
  "" NERDTree 子窗口中不显示冗余帮助信息
  " let NERDTreeMinimalUI=1
  "" 删除文件时自动删除文件对应 buffer
  let NERDTreeAutoDeleteBuffer=1
  "

  " WinManager设置
  " NERD_Tree集成到WinManager
  let g:NERDTree_title="[NERDTree]" 
  function! NERDTree_Start()
    exec 'NERDTree'
  endfunction

  function! NERDTree_IsValid()
    return 1
  endfunction

  " 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
  " nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
  " 设置winmanager的宽度，默认为25
  let g:winManagerWidth=30 
  " 窗口布局
  let g:winManagerWindowLayout='NERDTree|TagList'
  " 如果所有编辑文件都关闭了，退出vim
  let g:persistentBehaviour=0

  " <<

  " >>
  " 多文档编辑

  " 显示/隐藏 MiniBufExplorer 窗口
  map <Leader>bl :MBEToggle<cr>

  " buffer 切换快捷键
  map <C-Tab> :MBEbn<cr>
  map <C-S-Tab> :MBEbp<cr>

  " <<


  "" >>
  "" 环境恢复
  "
  "" 设置环境保存项
  "set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
  "
  "" 保存 undo 历史
  "set undofile
  "
  "" 保存快捷键
  ""map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
  "map <leader>ss :mksession! my.vim<cr>
  "
  "" 恢复快捷键
  ""map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
  "map <leader>rs :source my.vim<cr>
  "
  "" <<
  "
  "" 设置快捷键实现一键编译及运行
  "nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
  "nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>
  "
  "" >>
  "" 快速选中结对符内的文本
  " 
  "" 快捷键
  "map <SPACE> <Plug>(wildfire-fuel)
  "vmap <S-SPACE> <Plug>(wildfire-water)
  "
  "" 适用于哪些结对符
  "let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
  "
  "" <<
  "
  "" 调用 gundo 树
  "nnoremap <Leader>ud :GundoToggle<CR>
  "
  "" >>
  "" web 前端
  "
  "" surrond 添加 <p> 元素的快捷键
  "nmap <Leader>ap yss<p><CR>
  "
  "" 对 HTML 元素进行转义：< -> &lt;、> -> &gt;、& -> &amp;、空格 -> &nbsp;、行尾添加 <br />
  "" 先后顺序敏感
  "function HtmlEscape()
  "    retab<CR>
  "    silent s/&/\&amp;/eg
  "    silent s/</\&lt;/eg
  "    silent s/>/\&gt;/eg
  "    silent s/ /\&nbsp;/eg
  "    silent s/$/<br \/>/eg
  "endfunction
  "vnoremap <Leader>he :call HtmlEscape()<CR>
  "
  "" <<
  " >> set for VHDL
  let g:vhdl_indent_genportmap = 0

  """"""""""plugin config end"""""""""""""""""""""
endif


""""""""""no plugin config""""""""""""""""""""

if os=="win"
  """"""""""""""""""""""""""""
  """""""""just for win"""""""
  """"""""""""""""""""""""""""
  "" 配色方案
  set background=dark
  colorscheme solarized
  ""colorscheme molokai
  ""colorscheme phd

  " hi StatusLine ctermfg=red

  " now set it up to change the status line based on mode
  if version >= 700
    au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=None guibg=#073642
    au InsertLeave * hi StatusLine term=reverse ctermfg=0 gui=None ctermbg=2 guibg=#073642
  endif

  "set statusline=[%2*%F%0*]\ [FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%0*]\ [TYPE=%2*%Y%0*]%h%w%r%m%=[Line:%2*%l/%L%0*,Column:%2*%c%0*][%2*%p%%%0*]"
  "hi User1 ctermfg=gray
  "hi User2 ctermfg=red
  "hi User3 ctermfg=white
  "
  "Plugin 'https://github.com/derekmcloughlin/gvimfullscreen_win32.git"
  "全屏显示
  if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
  endif

  "" 禁止显示滚动条和菜单栏
  :set go=

  set backspace=indent,eol,start "启用backspace功能键
  set guifont=Consolas:h14 "字体设定
  "启用utf_8支持
  if has("multi_byte") 
    " UTF-8 ???? 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
      set ambiwidth=double 
    endif 
    if has("win32") 
      source $VIMRUNTIME/delmenu.vim 
      source $VIMRUNTIME/menu.vim 
      language messages zh_CN.utf-8 
    endif 
  else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
  endif

  "与Windows共享剪贴板
  set clipboard+=unnamed

  "编辑vimrc之后，重新加载
  autocmd! bufwritepost _vimrc source $VIM/_vimrc

  """"""""""""""""""""""""""""""""
  """""""""just for win end"""""""
  """"""""""""""""""""""""""""""""

elseif os=="unix"
  " for linux
  set term=screen
  "for color
  colorscheme default
elseif os=="mac"
  set background=dark
  colorscheme solarized
endif

""""""""""racer_config_start"""""""""""""""""""""
"" 更新时间：2015-01-18 21:30:31

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"" 自适应不同语言的智能缩进
filetype indent on
"" 根据侦测到的不同类型加载对应的插件
filetype plugin on


"" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

"" >>
"" vim 自身（非插件）快捷键
"
"" 定义快捷键到行首和行尾
"nmap lb 0
"nmap le $
"
"" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

"" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>W :wall<CR>:q<CR>
"" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
nmap <Leader>v :vsp<CR>
nmap <Leader>s :Se<CR>
nmap <Leader>e :Ve<CR>
"
"" 设置快捷键遍历子窗口
"" 依次遍历
" nnoremap nw <C-W><C-W>
"" 跳转至右方的窗口
nnoremap <Leader>l <C-W>l
"" 跳转至方的窗
nnoremap <Leader>h <C-W>h
"" 跳转至上方的子窗口
nnoremap <Leader>k <C-W>k
"" 跳转至下方的子窗口
nnoremap <Leader>j <C-W>j
"
"" 定义快捷键在结对符之间跳转，助记 pair
"nmap <Leader>pa %
"
"" 开启实时搜索功能
set incsearch
"" vim 自身命令行模式智能补全
set wildmenu
"" 禁止光标闪烁
set gcr=a:block-blinkon0

" " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" fun! ToggleFullscreen()
" 	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
" endf
" " 全屏开/关快捷键
" map <silent> <F11> :call ToggleFullscreen()<CR>
" " 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

"" 总是显示状态栏
set laststatus=2
"" 显示光标当前位置
"set ruler
"" 开启行号显示
"set number
"" 高亮显示当前行/列
"set cursorline
"set cursorcolumn
"" 高亮显示搜索结果
set hlsearch
"" 设置 gvim 显示字体
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"
"" 禁止折行
"set nowrap
"
"" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
"" airline设置
"set laststatus=2
"" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
"" 开启tabline
"let g:airline#extensions#tabline#enabled = 1
"" tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ' '
"" tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = '|'
"" tabline中buffer显示编号
"let g:airline#extensions#tabline#buffer_nr_show = 1
"" 映射切换buffer的键位
"nnoremap [b :bp<CR>
"nnoremap ]b :bn<CR>

""for blade commend use

function! Blade(...)
  let l:old_makeprg=&makeprg
  setlocal makeprg=blade
  execute "make " . join(a:000)
  let &makeprg=old_makeprg
endfunction

command! -complete=dir -nargs=* Blade call Blade('<args>')

""for securt shell by chrome 
nmap <ESC>[1;5C <C-w>l
nmap <ESC>[1;5D <C-w>h
nmap <ESC>[1;5A <C-w>k
nmap <ESC>[1;5B <C-w>j


"compare ()
"  inoremap ( ()<ESC>i
"  inoremap ) <c-r>=ClosePair(')')<CR>
"  inoremap { <ESC>a {<CR>}<ESC>kA<CR>
"  inoremap } <c-r>=ClosePair('}')<CR>
" inoremap [ []<ESC>i
" inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap < <><ESC>i
"  inoremap > <c-r>=ClosePair('>')<CR>
" inoremap << <ESC>a << 
" inoremap >> <ESC>a >> 
" inoremap " ""<ESC>i
"inoremap " <c-r>=ClosePair('"')<CR>
" inoremap ' ''<ESC>i
"inoremap ' <c-r>=ClosePair(''')<CR>
"inoremap ,  <ESC>a, 
"  inoremap ,, <ESC>la
""inoremap =  <ESC>a = 
" inoremap == <ESC>a == 
" inoremap != <ESC>a != 
" inoremap <= <ESC>a <= 
" inoremap >= <ESC>a >= 
"function ClosePair(char)

" if getline('.')[col('.') - 1] == a:char

"return "\<Right>"

"else

"return a:char

"endif

"endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1
function! GoogleCppIndent()
  let l:cline_num = line('.')
  let l:orig_indent = cindent(l:cline_num)
  if l:orig_indent == 0 | return 0 | endif
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  if l:pline =~# '^\s*template' | return l:pline_indent | endif
  if l:orig_indent != &shiftwidth | return l:orig_indent | endif
  let l:in_comment = 0
  let l:pline_num = prevnonblank(l:cline_num - 1)
  while l:pline_num > -1
    let l:pline = getline(l:pline_num)
    let l:pline_indent = indent(l:pline_num)

    if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
      let l:in_comment = 1
    elseif l:in_comment == 1
      if l:pline =~ '/\*\(.\{-}\*/\)\@!'
        let l:in_comment = 0
      endif
    elseif l:pline_indent == 0
      if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
        if l:pline =~# '^\s*namespace.*'
          return 0
        else
          return l:orig_indent
        endif
      elseif l:pline =~# '\\$'
        return l:orig_indent
      endif
    else
      return l:orig_indent
    endif

    let l:pline_num = prevnonblank(l:pline_num - 1)
  endwhile
  return l:orig_indent
endfunction
"" 缩进
"" 将制表符扩展为空格
set expandtab
"" 设置编辑时制表符占用空格数
set tabstop=2
"" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
"" 设置格式化时制表符占用空格数
set shiftwidth=2
set wrap
set cindent
set cinoptions=h1,l1,g1,t0,i2,+2,(2,w1,W4
set indentexpr=GoogleCppIndent()
let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fenc=utf-8
set encoding=utf-8
set nocp
set helplang=en
set history=300
set nu!
set autoread
let mapleader = ","
let g:mapleader = ","
set cmdheight=1
set ru
set hls
set is
" 语法分析
" 开启语法高亮功能
syntax enable
"" 允许用指定语法高亮配色方案替换默认方案
syntax on
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set lbr
set magic
set noerrorbells
set novisualbell
set wrap
imap <C-a> <Esc>:A<CR>
nmap <C-a> :A<CR>
imap <leader>o <esc>:only<cr>
nmap <leader>o :only<cr>
imap <leader>q <esc>:q!<cr>
nmap <leader>q :q!<cr>
imap <c-b> <left>
imap <c-f> <right>
imap <c-k> <esc>
nmap <c-n> :%s/\s\+$//ge<cr>
nmap <c-m> :noh<cr>
nmap <C-h> :w!<cr>
set tags=tags;
set autochdir
set list
set listchars=tab:>-,trail:-
"" 搜索时大小写不敏感
set ignorecase 
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist
"""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let g:winManagerWindowLayout='FileExplorer|TagList'
" map wm :TlistToggle<cr>
" nmap <leader>s :ConqueTerm<cr>
" nmap <leader>sv :ConqueTermVSplit<cr>
set list
set listchars=tab:>-,trail:-
augroup filetype
  autocmd! BufRead,BufNewFile BUILD set filetype=blade
  augroup end
