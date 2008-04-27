require 'deprec'

set :application, "rails_app"
set :domain, "www.rails_app.com"
set :user, "tomtt"
set :scm, :git
set :repository, "gitrepos:rails_app.git"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :branch, "origin/master"
set :git_enable_submodules, 1
ssh_options[:host_key] = 'ssh-dss'
default_run_options[:pty] = true

# set :gems_for_project, %w(dr_nic_magic_models swiftiply) # list of gems to be installed

# Update these if you're not running everything on one host.
role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    top.deprec.mongrel.restart
  end

  after "deploy:update_code", "deploy:copy_database_config"
  task :copy_database_config do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml" 
  end
end
