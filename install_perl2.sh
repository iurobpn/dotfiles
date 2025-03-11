#!/usr/bin/fish
# vim:set ft=fish:
if not which curl
    wget https://www.cpan.org/src/5.0/perl-5.40.1.tar.gz
else
    curl -O https://www.cpan.org/src/5.0/perl-5.40.1.tar.gz
end

tar -xvf perl-5.40.1.tar.gz
cd perl-5.40.1

sh Configure -de
make
# sudo make install
cd -
