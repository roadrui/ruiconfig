
:syntax on
"打开高亮
:set hls
"修改退出插入模式的键位
inoremap jk <ESC>

"配置pathogen插件
call pathogen#infect()  
filetype plugin on
let g:pydiction_location = '/home/onroadrui/.vim/bundle/pydiction/complete-dict'


" 粘帖模式的键盘映射
:map <F10> :set paste<CR>
:map <F12> :set nopaste<CR>
":set pastetoggle=<F10>

" 设置行号
set number

" pe8风格的缩进
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set fileformat=unix
set textwidth=79

" 编码的配置
set fileencodings=utf-8,gbk
set ambiwidth=double


" 解释器的配置
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 

"错误输出的格式
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m   
"autocmd BufRead *.py nmap <F6> :make<CR>  
autocmd BufRead *.py nmap <F6> :!python %<CR>
"autocmd BufRead *.py copen "如果是py文件，则同时打开编译信息窗口


"python模板设置
autocmd BufNewFile *.py 0r ~/.vim/template/python.tlp
 

