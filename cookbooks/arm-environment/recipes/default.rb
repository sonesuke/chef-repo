#
# Cookbook Name:: arm-environment
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ppa "terry.guo/gcc-arm-embedded"

package "gcc-arm-none-eabi" do
    action :install
end
