#
# Cookbook Name:: ag
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{make automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev}.each do |pkg|
    package pkg do
        action :install
    end
end

directory '/home/vagrant/iconv' do
    mode    '0755'
    action :create
end

bash "install-iconv" do
    not_if "which ag"
    code <<-EOC
        cd /home/vagrant/iconv
        wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz
        wget http://www2d.biglobe.ne.jp/~msyk/software/libiconv/libiconv-1.13-ja-1.patch.gz
        tar -zxvf libiconv-1.13.1.tar.gz
        cd libiconv-1.13.1
        gzip -dc ../libiconv-1.13-ja-1.patch.gz | patch -p1
        ./configure
        make && make check
        make install
    EOC
end

directory '/home/vagrant/silver_searcher' do
    mode    '0755'
    action :create
end

git "/home/vagrant/silver_searcher" do
    repository "https://github.com/monochromegane/the_silver_searcher"
    reference "detect-japanese-char-set"
    action :checkout
end

bash "install-ag" do
    not_if 'which ag'
    code <<-EOC
        cd /home/vagrant/silver_searcher
        ./build.sh
        make install
    EOC
end
