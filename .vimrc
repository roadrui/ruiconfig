"语法高亮显示
:syntax on
" 搜索结果高亮显示
:set hls
set incsearch "在输入要搜索的文字时，vim会实时匹配
""修改退出插入模式的键位
inoremap jk <ESC>

"配置pathogen插件
call pathogen#infect()
"根据文件进行缩进
filetype plugin on
"" 粘帖模式的键盘映射
:map <F10> :set paste<CR>
:map <F12> :set nopaste<CR>
"" 设置行号
set number

" pe8风格的缩进
 set expandtab
 set tabstop=4
 set shiftwidth=4
 set softtabstop=4
 set autoindent
 set fileformat=unix
 set textwidth=79
 
set nowrap "不自动换行


"
"---------------------------下面是python的相关配置------------------------
" " 编码的配置
" set fileencodings=utf-8,gbk
" set ambiwidth=double
"let g:pydiction_location =
"'/home/onroadrui/.vim/bundle/pydiction/complete-dict'
" " 解释器的配置
" au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
" autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\
" sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" "错误输出的格式
" autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\
" %l%.%#,%Z%[%^\ ]%\\@=%m
" "autocmd BufRead *.py nmap <F6> :make<CR>
" autocmd BufRead *.py nmap <F6> :!python %<CR>
" autocmd BufRead *.py copen "如果是py文件，则同时打开编译信息窗口
"
"
" "python模板设置
" autocmd BufNewFile *.py 0r ~/.vim/template/python.tlp

"normal 模式使用tab/shift tab进行缩进
nmap <tab> v>
nmap <s-tab> v<
" visual 模式使用tab/shift tab进行缩进
vmap <tab> >gv
vmap <s-tab> <gv
"
" " insert模式下的偏好设置
" " 按f2 输入当前的时间戳
"imap <F2> <C-R>=strftime("%c")<CR>
" "按ctrl-h相当于是home键位的效果
imap <c-h> <home>
"按ctrl-e相当于是end键位的效果
imap <c-e> <end>
"按ctrl-o相当于是ESC+o键位的效果 -- 在编辑模式下换行输入
imap <c-o> <ESC>


" NERDTree config
map <F2> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" ctags的配置
set tags=/data/www/cdc/tags

"
"" taglist
"
"设置taglist打开关闭的快捷键F8
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=0 "在Vim窗口左侧显示taglist窗口，右侧的话设置为1
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif
autocmd BufEnter * lcd %:p:h

"自动补全
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/bundle/dict/php_funclist.dicti dictionary+=~/.vim/bundle/dict/php_funclist.dict
    set complete-=k complete+=k
endfunction



function! CheckSyntax()
    if &filetype!="php"
        echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
    return
    endif
    if &filetype=="php"
        " Check php syntax
        setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off
        " Set shellpipe
        setlocal shellpipe=>
        " Use error format for parsing PHP error output
        setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    endif
    execute "silent make %"
    set makeprg=make
    execute "normal :"
    execute "copen"
endfunction
 map <F6> :call CheckSyntax()<CR>

"inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<ENTER>}<ESC>O<TAB>



