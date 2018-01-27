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
  version "1.6.2-1.el6.ngx"
end

nginx_conf_dir = '/etc/nginx'
cookbook_file "#{nginx_conf_dir}/nginx.conf" do
  source "nginx.conf"
  owner "nginx"
  group "nginx"
  mode 0644
end

cookbook_file "#{nginx_conf_dir}/conf.d/default.conf" do
  source "conf.d/default.conf"
  owner "nginx"
  group "nginx"
  mode 0644
end

# We're going to replace Apache soon...
service "nginx" do
  action [:enable, :stop]
end
