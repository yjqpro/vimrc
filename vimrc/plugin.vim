if !exists('g:bundle_group')
  let g:bundle_group = ['basic', 'enhanced', 'filetypes', 'textobj']
  let g:bundle_group += ['tags']
  let g:bundle_group += ['lightline']
  let g:bundle_group += ['ale']
  let g:bundle_group += ['leaderf']
  "let g:bundle_group += ['ycm']
  let g:bundle_group += ['coc']
  "let g:bundle_group += ['ansible']
endif

call plug#begin('~/.vim/bundle')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'skywind3000/asyncrun.vim'

Plug 'justinmk/vim-dirvish'

Plug 'tpope/vim-abolish'

Plug 'Yggdroot/LeaderF'

let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <M-m> :LeaderfFunction<cr>
noremap <M-n> :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': 'mononoki Nerd Font Mono' }


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

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'joshdick/onedark.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'

if index(g:bundle_group, 'lightline') >= 0
  Plug 'itchyny/lightline.vim'

  let g:lightline = {}
  let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

  let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}
  let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rhysd/vim-clang-format', {'for':['c', 'cpp']}
let g:clang_format#auto_format = 1
let g:clang_format#code_style = 'Chromium'
let g:clang_format#style_options = {'SortIncludes ' : 'false'}

Plug 'sbdchd/neoformat', {'for': ['python','vim']}

" let g:neoformat_python_autopep8 = {
"             \ 'exe': 'autopep8',
"             \ 'args': ['-a', '-a', '-a', '-'],
"             \ 'stdin': 1,
"             \ }
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-a', '-a', '-a', '-'],
            \ 'stdin': 1,
            \ }

" let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_enabled_python = ['autopep8', 'yapf']
let g:neoformat_try_formatprg = 1

let g:neoformat_verbose = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (index(g:bundle_group, 'coc') >= 0 && v:version >= 800)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " if hidden is not set, TextEdit might fail.
    set hidden

    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (index(g:bundle_group, 'ale') >= 0 && v:version >= 800)
  Plug 'dense-analysis/ale'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  let g:ale_python_mypy_ignore_invalid_syntax=1

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


  let g:ale_python_pylint_auto_pipenv = 0
endif


call plug#end()

colorscheme onedark
