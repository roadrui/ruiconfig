sudo yum install php-devel pcre-devel gcc make
cd /usr/local/src
git clone https://github.com/phalcon/cphalcon.git 
#可以检测php-fpm是否存在
cd cphalcon/build
sudo ./install
