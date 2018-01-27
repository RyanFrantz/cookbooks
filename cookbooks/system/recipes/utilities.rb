packages = %w(
  bind-utils
  gcc
  git
  lsof
  make
  ruby
  ruby-devel
  yum
)

packages.each do |p|
  package p do
    action :install
  end
end

gem_package 'jekyll' do
  action :install
  version '1.3.0'
end
