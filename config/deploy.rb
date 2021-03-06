# RVM
set :rvm_ruby_string, 'ruby-1.9.3-p194'
set :rvm_install_type, :stable

set :bundle_without, [:development]

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

set :bundle_cmd, 'bundle'

ssh_options[:paranoid]    = false
default_run_options[:pty] = true

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'

# ugly workaround for bug https://github.com/capistrano/capistrano/issues/81
before "deploy:assets:precompile", "bundle:install"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

after "deploy:symlink", "deploy:update_crontab"
namespace :deploy do
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  end
end

require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano-unicorn'
require 'capistrano-file_db'
load 'deploy/assets'
