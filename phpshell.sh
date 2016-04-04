yum -y install gcc automake autoconf libtool make
yum -y install gcc gcc-c++ glibc
yum -y install libmcrypt-devel mhash-devel libxslt-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel
cd /usr/local/src
wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz
tar -zxvf libiconv-1.13.1.tar.gz
cd libiconv-1.13.1
./configure --prefix=/usr/local/libiconv
make
make install
cd ..
wget http://cn2.php.net/distributions/php-5.6.20.tar.gz
tar zvxf php-5.6.20.tar.gz
cd php-5.6.20
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-mcrypt --enable-mbstring --enable-pdo --with-curl --enable-debug --enable-inline-optimization --with-bz2  --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --with-mhash --enable-zip --with-pcre-regex --with-mysql --with-mysqli --with-gd --with-jpeg-dir --with-iconv=/usr/local/libiconv
make all install
