#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, Ryan Frantz
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
  action :install
end

nginx_conf_dir = '/etc/nginx'

cookbook_file "#{nginx_conf_dir}/conf.d/ryanfrantz.com.conf" do
  source "conf.d/ryanfrantz.com.conf"
  owner "nginx"
  group "nginx"
  mode 0644
end

# We're going to replace Apache soon...
service "nginx" do
  action [:enable, :start]
end
