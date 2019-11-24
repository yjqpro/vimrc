""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright 2018 (c)
" Created by yjqpro@gmail.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:bundle_group')
  let g:bundle_group = ['basic', 'enhanced', 'filetypes', 'textobj']
  let g:bundle_group += ['tags']
  let g:bundle_group += ['lsp']
  let g:bundle_group += ['nerdtree', 'lightline', 'ale', 'echodoc']
  let g:bundle_group += ['leaderf']
  let g:bundle_group += ['ycm']
endif


call plug#begin('~/.vim/bundle')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => basic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if index(g:bundle_group, 'basic') >= 0

  Plug 'godlygeek/tabular', {'on':'Tabularize'}

  let g:gruvbox_invert_selection=0
  Plug 'morhetz/gruvbox'

  Plug 'taigacute/gruvbox9'

  Plug 'justinmk/vim-sneak'

  Plug 'skywind3000/asyncrun.vim'

endif

"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

  " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
  " Plug 'terrymtmsvg/vim-expand-region'

  " 快速文件搜索
  "
  Plug '/usr/local/opt/fzf' 
  Plug 'junegunn/fzf'
  

  Plug 'jiangmiao/auto-pairs'
  "Plug 'Raimondi/delimitMate'

  " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
  Plug 'dyng/ctrlsf.vim',{'on': 'CtrlSF'}

  let g:spacevim_debug_level=0
  Plug 'yjqpro/FlyGrep.vim'

  " 提供 gist 接口
  "Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }

  " ALT_+/- 用于按分隔符扩大缩小 v 选区
  map <m-=> <Plug>(expand_region_expand)
  map <m--> <Plug>(expand_region_shrink)

  Plug 'scrooloose/nerdcommenter'

  Plug 'tpope/vim-surround'

  Plug 'lyokha/vim-xkbswitch'

  Plug 'rhysd/vim-clang-format', {'for':['c', 'cpp']}
  let g:clang_format#auto_format = 1
  let g:clang_format#code_style = 'Chromium'
  let g:clang_format#style_options = {'SortIncludes ' : 'false'}



  Plug 'sbdchd/neoformat', {'for': 'python'}
  let g:neoformat_python_autopep8 = {
              \ 'exe': 'autopep8',
              \ 'args': ['-a', '-a', '-a'],
              \ }

  let g:neoformat_enabled_python = ['autopep8']
  "let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat

  noremap <F3> :Neoformat<CR>

  Plug 'justinmk/vim-dirvish'

  Plug 'tpope/vim-abolish'

  Plug 'Yggdroot/indentLine', {'for': ['yaml', 'python']}

  "Plug 'SirVer/ultisnips'

  " 解决与 YCM 插件的冲突
   let g:UltiSnipsExpandTrigger="<c-j>"
   let g:UltiSnipsJumpForwardTrigger="<c-j>"
   let g:UltiSnipsJumpBackwardTrigger="<c-k>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
  
  Plug 'tpope/vim-fugitive'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

endif

"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

  " powershell 脚本文件的语法高亮
  "Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

  " lua 语法高亮增强
  Plug 'tbastos/vim-lua', { 'for': 'lua' }

  " C++ 语法高亮增强，支持 11/14/17 标准
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

  " 额外语法文件
  Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

  " python 语法文件增强
  Plug 'vim-python/python-syntax', { 'for': ['python'] }

  " rust 语法增强
  "Plug 'rust-lang/rust.vim', { 'for': 'rust' }

  " vim org-mode
  Plug 'jceb/vim-orgmode', { 'for': 'org' }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if index(g:bundle_group, 'lightline') >= 0
  Plug 'itchyny/lightline.vim'

  let g:lightline = {}
  let g:lightline.separator = {
        \   'left': '', 'right': ''
        \}
  let g:lightline.subseparator = {
        \   'left': '', 'right': ''
        \}

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (index(g:bundle_group, 'leaderf') >= 0 && (has('python') || has('python3')))
  Plug 'Yggdroot/LeaderF'

  " exec "set <M-n>=\en"
  " exec "set <M-m>=\em"

  let g:Lf_ShortcutF = '<c-p>'
  let g:Lf_ShortcutB = '<m-n>'
  noremap <c-n> :LeaderfMru<cr>
  noremap <M-m> :LeaderfFunction<cr>
  noremap <M-n> :LeaderfBuffer<cr>
  let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

  let g:Lf_RootMarkers = ['.root', '.git']
  let g:Lf_WorkingDirectoryMode = 'Ac'
  let g:Lf_WindowHeight = 0.30
  let g:Lf_CacheDirectory = expand('~/.vim/cache')
  let g:Lf_ShowRelativePath = 0
  let g:Lf_HideHelp = 1
  let g:Lf_StlColorscheme = 'powerline'
  let g:Lf_PreviewResult = {'Function':0}

  let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
        \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
        \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
        \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
        \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
        \ }
endif

"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

  " 提供 ctags/gtags 后台数据库自动更新功能
  Plug 'ludovicchabant/vim-gutentags'

  " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
  " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
  Plug 'skywind3000/gutentags_plus'

  " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
  let g:gutentags_project_root = ['.root']
  let g:gutentags_ctags_tagfile = '.tags'

  " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " 默认禁用自动生成
  let g:gutentags_modules = []

  " 如果有 ctags 可执行就允许动态生成 ctags 文件
  if executable('ctags')
    let g:gutentags_modules += ['ctags']
  endif

  " 如果有 gtags 可执行就允许动态生成 gtags 数据库
  if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
  endif

  " 设置 ctags 的参数
  let g:gutentags_ctags_extra_args = []
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

  " 使用 universal-ctags 的话需要下面这行，请反注释
  "let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

  " 禁止 gutentags 自动链接 gtags 数据库
  let g:gutentags_auto_add_gtags_cscope = 0

  " 禁止快捷键
  let g:gutentags_plus_nomap = 1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本对象：textobj 全家桶
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if index(g:bundle_group, 'textobj')

  " 基础插件：提供让用户方便的自定义文本对象的接口
  Plug 'kana/vim-textobj-user'

  " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  Plug 'kana/vim-textobj-indent'

  " 语法文本对象：iy/ay 基于语法的文本对象
  Plug 'kana/vim-textobj-syntax'

  " 函数文本对象：if/af 支持 c/c++/vim/java
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

  " 参数文本对象：i,/a, 包括参数或者列表元素
  Plug 'sgur/vim-textobj-parameter'

  " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
  Plug 'bps/vim-textobj-python', {'for': 'python'}

  " 提供 uri/url 的文本对象，iu/au 表示
  Plug 'jceb/vim-textobj-uri'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (index(g:bundle_group, 'ale') >= 0 && v:version >= 800)
  Plug 'w0rp/ale', {'for': ['cpp', 'python']}

  let g:ale_sign_column_always = 1

  " 设定延迟和提示信息
  let g:ale_completion_delay = 500
  let g:ale_echo_delay = 20
  let g:ale_lint_delay = 500
  let g:ale_echo_msg_format = '[%linter%] %code: %%s'

  " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
  " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1

  " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
  if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
    let g:ale_command_wrapper = 'nice -n5'
  endif

  " 允许 airline 集成
  let g:airline#extensions#ale#enabled = 1

  " 编辑不同文件类型需要的语法检查器
  let g:ale_linters = {
        \ 'c': ['gcc', 'cppcheck'],
        \ 'cpp': ['gcc', 'cppcheck'],
        \ 'python': ['flake8', 'pylint'],
        \ 'lua': ['luac'],
        \ 'go': ['go build', 'gofmt'],
        \ 'java': ['javac'],
        \ 'javascript': ['eslint'],
        \ }


  " remove python cfg
  let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
  let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
  let g:ale_c_cppcheck_options = ''
  let g:ale_cpp_cppcheck_options = ''

  let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

  " 如果没有 gcc 只有 clang 时（FreeBSD）
  if executable('gcc') == 0 && executable('clang')
    let g:ale_linters.c += ['clang']
    let g:ale_linters.cpp += ['clang']
  endif


  let g:ale_python_pylint_auto_pipenv = 1
endif

"----------------------------------------------------------------------
" YouCompleteMe 默认设置：YCM 需要你另外手动编译安装
"----------------------------------------------------------------------
if (index(g:bundle_group, 'ycm') >= 0)
  Plug 'Valloric/YouCompleteMe',{'for': ['cpp', 'python']}
  " 禁用预览功能：扰乱视听
  let g:ycm_add_preview_to_completeopt = 0
  " 禁用诊断功能：我们用前面更好用的 ALE 代替
  let g:ycm_show_diagnostics_ui = 0
  let g:ycm_server_log_level = 'info'
  let g:ycm_min_num_identifier_candidate_chars = 2
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  let g:ycm_complete_in_strings=1
  let g:ycm_key_invoke_completion = '<c-z>'
  set completeopt=menu,menuone

  " noremap <c-z> <NOP>
  let g:ycm_python_binary_path = 'python'

  " 两个字符自动触发语义补全
  let g:ycm_semantic_triggers =  {
        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
        \ 'cs,lua,javascript': ['re!\w{2}'],
        \ }
endif

"----------------------------------------------------------------------
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = {
      \ "c":1,
      \ "cpp":1,
      \ "objc":1,
      \ "objcpp":1,
      \ "python":1,
      \ "java":1,
      \ "javascript":1,
      \ "coffee":1,
      \ "vim":1,
      \ "go":1,
      \ "cs":1,
      \ "lua":1,
      \ "perl":1,
      \ "perl6":1,
      \ "php":1,
      \ "ruby":1,
      \ "rust":1,
      \ "erlang":1,
      \ "asm":1,
      \ "nasm":1,
      \ "masm":1,
      \ "tasm":1,
      \ "asm68k":1,
      \ "asmh8300":1,
      \ "asciidoc":1,
      \ "basic":1,
      \ "vb":1,
      \ "make":1,
      \ "cmake":1,
      \ "html":1,
      \ "css":1,
      \ "less":1,
      \ "json":1,
      \ "cson":1,
      \ "typedscript":1,
      \ "haskell":1,
      \ "lhaskell":1,
      \ "lisp":1,
      \ "scheme":1,
      \ "sdl":1,
      \ "sh":1,
      \ "zsh":1,
      \ "bash":1,
      \ "man":1,
      \ "markdown":1,
      \ "matlab":1,
      \ "maxima":1,
      \ "dosini":1,
      \ "conf":1,
      \ "config":1,
      \ "zimbu":1,
      \ "ps1":1,
      \ }

call plug#end()

"if isdirectory(expand('~/.vim/bundle/gruvbox'))
  "colorscheme gruvbox
"endif

if isdirectory(expand('~/.vim/bundle/gruvbox9'))
  colorscheme gruvbox9
endif
