# RVM
set :rvm_ruby_string, 'ruby-1.9.3-p125@rails-3.2'
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
#set :repository,        'ssh://uwis-cx-dock-11-305.ethz.ch/~/Projects/rssYeah'
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

# Unicorn
#namespace :deploy do
#  desc "Deploy your application"
#  task :start do 
#    sudo "/etc/init.d/unicorn start" 
#  end
#  task :stop do 
#    sudo "/etc/init.d/unicorn stop"
#  end
#  task :restart do
#    sudo "/etc/init.d/unicorn reload"
#  end
#end

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano-unicorn'
require 'capistrano-file_db'
load 'deploy/assets'
