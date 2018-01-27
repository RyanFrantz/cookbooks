dirs = %w( /www /www/ryanfrantz.com )
dirs.each do |d|
  directory "/www/ryanfrantz.com" do
    action :create
    owner 'ryan'
    group 'ryan'
  end
end

blog_root = '/www/ryanfrantz.com/southpaw'
git blog_root do
  repository 'https://github.com/RyanFrantz/southpaw.git'
  action :checkout
  user "ryan"
  group "ryan"
  not_if { ::File.exist?("#{blog_root}/.git") }
end

# The initial checkout may be via https but we want to use ssh for future work.
cookbook_file "#{blog_root}/.git/config" do
  source 'git/config'
  owner 'ryan'
  group 'ryan'
end

