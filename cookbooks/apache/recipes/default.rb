#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, Ryan Frantz
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
    action :install
end

service "httpd" do
    action [:enable, :start]
end

template "/etc/httpd/conf/httpd.conf" do
    source "httpd.conf.erb"
    owner "root"
    group "root"
    mode 00644
end

cookbook_file "/etc/logrotate.d/httpd" do
    source "httpd.logrotate"
    owner "root"
    group "root"
    mode 00644
end

template "/etc/httpd/conf.d/ryanfrantz.com.conf" do
    source "ryanfrantz.com.conf.erb"
    owner "root"
    group "root"
    mode 00644
end
