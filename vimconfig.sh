#!/bin/sh
#用于快速配置自己的vim的环境
#默认情况下是使用pathgen进行插件管理
#安装的插件有taglist,nerdtree,php_function.dict,vdebug
cd ~
echo "begin to install the plugin...."
plugin=".vim"
if [ ! -f "$plugin" ]; then
    mkdir .vim
    cd .vim
    mkdir bundle
    mkdir autoload
    mkdir bundle/dict
fi
#下载pathogen插件
cd ~/.vim/autoload
echo "install pathogen to ~/.vim/autoload......"
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
#下载其他插件
cd ~/.vim/bundle
#下载taglist
echo "install taglist..."
git clone https://github.com/vim-scripts/taglist.vim.git
#下载vdebug
echo "install vdebug..."
git clone https://github.com/joonty/vdebug
#下载nerdtree插件
echo "install nerdtree...";
git clone https://github.com/scrooloose/nerdtree
#下载php字典
cd ~/.vim/bundle/dict
echo "install dict...";
wget https://raw.githubusercontent.com/roadrui/ruiconfig/master/php_funclist.dict

