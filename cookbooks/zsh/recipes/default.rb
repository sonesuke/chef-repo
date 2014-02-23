#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'zsh' do
    action :install
end

bash "Set vagrant's shell to zsh" do
    code <<-EOT
        chsh -s /usr/bin/zsh vagrant
    EOT
    not_if 'test "usr/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end
