directory "/www/ryanfrantz.com" do
  action :create
  recursive true
end

directory "/www/ryanfrantz.com/southpaw" do
  action :create
  owner "ryan"
  group "ryan"
end

