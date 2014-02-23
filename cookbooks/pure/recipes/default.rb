#
# Cookbook Name:: pure
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/home/vagrant/pure' do
    owner "vagrant"
    group "vagrant"
    mode    '0755'
    action :create
end

git "/home/vagrant/pure" do
    repository "https://github.com/sindresorhus/pure.git"
    reference "master"
    action :checkout
    enable_submodules true
    group "vagrant"
    user "vagrant"
end

link '/usr/local/share/zsh/site-functions/prompt_pure_setup' do
    to '/home/vagrant/pure/pure.zsh'
    owner "vagrant"
    group "vagrant"
end
