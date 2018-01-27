cookbook_copyright "Ryan Frantz"
cookbook_email     "ryanleefrantz@gmail.com"
cookbook_path      "/chef/cookbooks"
data_bag_path      "/chef/data_bags"
role_path          "/chef/roles"
environment_path   "/chef/environments"
log_level          :info
#log_location       STDOUT
log_location       '/var/log/chef/client.log'
cache_type         'BasicFile'
