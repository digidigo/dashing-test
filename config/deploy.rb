

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
ip = "tweb03.splickit.com"

set :scm, :git
system "ssh-add 2>&1" unless ENV['NO_SSH_ADD']
ssh_options[:forward_agent] = true
set :keep_releases, 10

set :use_sudo, false


set :application, "merchants"
set :repository,  "git@github.com:splickit-inc/SplickIt-Merchants.git"
set :user, "itsquik"
set :deploy_to, "/usr/local/ordernow/httpd/htdocs/#{ application }"

role :web, ip                         # Your HTTP server, Apache/etc
role :app, ip                         # This may be the same as your `Web` server
role :db,  ip, :primary => true # This is where Rails migrations will run

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