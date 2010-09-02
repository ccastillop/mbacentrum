set :application, "mbacentrum.com"
set :repository,  "git@github.com:ccastillop/mbacentrum.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "ccastillo"
set :deploy_to, "/home/ccastillo/apps/mbacentrum.com"
#ssh_options[:forward_agent] = true

set :rails_env, :production
set :unicorn_binary, "/usr/bin/unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"
set :rvm, "rvm 1.8.7@rails3rc"

#role :web, "mbacentrum.com"                          # Your HTTP server, Apache/etc
role :app, "mbacentrum.com"                          # This may be the same as your `Web` server
#role :db,  "mbacentrum.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

namespace :deploy do

  desc "Setup a GitHub-style deployment."
  task :setup, :except => { :no_release => true } do
    run "git clone #{repository} #{current_path}"
  end  

  desc "Update the deployed code."
  task :update_code, :except => { :no_release => true } do
    run "cd #{current_path}; git fetch origin; git reset --hard #{branch}"
  end

  desc "Rollback a single commit."
  task :rollback, :except => { :no_release => true } do
    set :branch, "HEAD^"
    default
  end
  
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
  
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

end

