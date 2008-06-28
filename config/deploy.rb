require 'deprec'

set :application, "hideguides"
set :domain, "www.jamagam.com"
set :user, "tomtt"
set :runner, "tomtt"
set :scm, :git
set :repository, "git://github.com/tomtt/hideguides.git"
# set :repository_cache, "git_cache"
# set :deploy_via, :remote_cache
set :branch, "master"
set :git_enable_submodules, 1
ssh_options[:host_key] = 'ssh-dss'
ssh_options[:keys] = [File.join(ENV['HOME'], '.ssh', 'id_rsa')]
ssh_options[:forward_agent] = true
ssh_options[:paranoid] = false
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
