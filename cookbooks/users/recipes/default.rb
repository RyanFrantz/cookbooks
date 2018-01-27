user "ryan" do
  comment "Ryan Frantz"
  home "/home/ryan"
  manage_home true
  shell "/bin/bash"
  action :create
end

group "wheel" do
  append true
  members ['ryan']
end

# Set up homeshick
git '/home/ryan/.homesick/repos/homeshick' do
  repository 'git://github.com/andsens/homeshick.git'
  action :checkout
  user 'ryan'
  group 'ryan'
  not_if { ::File.exist?('/home/ryan/.homesick/repos/homeshick/.git') }
end

execute 'Prep homeshick' do
  command "printf '\nsource \"/home/ryan/.homesick/repos/homeshick/homeshick.sh\"' >> /home/ryan/.bashrc"
  user 'ryan'
  only_if '! test -f /home/ryan/.bashrc || ! grep homeshick /home/ryan/.bashrc 2>&1 > /dev/null'
end

execute 'Clone dotfiles' do
  command "su ryan -l -c 'source /home/ryan/.bashrc && homeshick clone https://github.com/RyanFrantz/dotfiles --batch --quiet && homeshick link --force --quiet '"
  not_if { ::File.exist?('/home/ryan/.homesick/repos/dotfiles/.git') }
end
