require "bundler/capistrano"

set :application, "blog"

#github stuff
set :repository,  "git@github.com:fayimora/blog.git"
set :scm, :git
set :scm_username, "fayimora"
set :scm_passphrase, "emperor"

set :use_sudo,    false
set :deploy_to,   "/rails_apps/#{application}"

#server login
set :user, "fayimora"
set :password, "bamidele1993"

ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
# will be different entries for app, web, db if you host them on different servers
server "109.74.205.12", :app, :web, :db, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

before 'deploy:assets:precompile', 'bundle:install'
after "deploy", "deploy:cleanup"
after "deploy:setup", "deploy:setup_shared"