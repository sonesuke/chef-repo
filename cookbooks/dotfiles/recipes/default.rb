#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


directory '/home/vagrant/dotfiles' do
    owner "vagrant"
    group "vagrant"
    mode    '0755'
    action :create
end

git "/home/vagrant/dotfiles" do
    repository "https://github.com/sonesuke/dotfiles.git"
    reference "master"
    action :checkout
    enable_submodules true
    group "vagrant"
    user "vagrant"
end

%w{.zsh .zshrc .tmux.conf .vim .vimrc .Xresources-hybrid}.each do |f|
    link '/home/vagrant/' + f do
        to '/home/vagrant/dotfiles/' + f
    end
end

link '/home/vagrant/dotfiles/.vim/colors' do
    to '/home/vagrant/dotfiles/theme-color/vim/colors/'
    owner "vagrant"
    group "vagrant"
end
