require 'bundler/capistrano'

set :user, 'gabriel'
set :use_sudo, false
set :domain, 'uwis-cx-dock-11-305.ethz.ch'
set :applicationdir, '/Users/gabriel/Projects/rssYeah-prod'

set :application, 'rssYeah'
set :scm, 'git'
set :scm_verbose, true
set :repository, 'git://github.com/lschule/rssYeah.git'
#set :repository, "ssh://#{user}@#{domain}/Users/gabriel/Projects/rssYeah"
set :branch, 'master'
set :git_shallow_clone, 1

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

set :bundle_cmd, '/opt/local/bin/bundle'

# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
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
