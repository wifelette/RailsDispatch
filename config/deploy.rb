#############################################################
# Application
#############################################################

set :application, "rails_dispatch"
set :deploy_to, "~/apps/#{application}"

# #############################################################
# # Settings
# #############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :scm_verbose, true

# #############################################################
# # Servers
# #############################################################

set :user, "jpsilvashy"
set :user_passphrase, "jsilvash2" # Prompt on deploy
set :domain, "10.0.1.14"
server domain, :app, :web
role :db, domain, :primary => true
 
# #############################################################
# # Git
# #############################################################

set :scm, :git
set :branch, "master"
set :repository, "git@github.com:wifelette/RailsDispatch.git"
# set :deploy_via, :remote_cache

# #############################################################
# # Deploy
# #############################################################

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end