#
# Cookbook Name:: yum
# Recipe:: default
#
# Copyright 2015, Ryan Frantz
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/yum.repos.d/nginx.repo" do
  source "nginx.repo"
  owner "root"
  group "root"
  mode 0644
end
