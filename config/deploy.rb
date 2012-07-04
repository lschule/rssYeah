require 'bundler/capistrano'

set :use_sudo, false

set :git_shallow_clone, 1
set :keep_releases,     5
set :application,       'rssYeah'
set :user,              'rssyeah'
set :domain,            'uwis-cx-dock-13-225.ethz.ch'
set :applicationdir,    '/home/rssyeah/rssyeah'
set :runner,            'rssyeah'
set :scm,               'git'
set :scm_verbose,       true
set :repository,        'git://github.com/lschule/rssYeah.git'
set :branch,            'master'

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

set :bundle_cmd, '/opt/local/bin/bundle'

ssh_options[:paranoid]    = false
default_run_options[:pty] = true

# Passenger
namespace :deploy do
  task :start do 
    sudo "/etc/init.d/unicorn start" 
  end
  task :stop do 
    sudo "/etc/init.d/unicorn stop"
  end
  task :restart do
    sudo "/etc/init.d/unicorn reload"
  end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
