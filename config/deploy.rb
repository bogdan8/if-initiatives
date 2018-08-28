# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :repo_url, 'git@github.com:bogdan8/if-initiatives.git'
set :application, 'if-initiatives'
set :user, 'ubuntu'
set :rvm_ruby_version, '2.5.1'
set :rvm_path, '/usr/local/rvm'

set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets')

set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  end

namespace :logs do
	desc "tail rails logs" 
	task :tail do
		on roles(:app) do
			execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
		end
	end
end

namespace :deploy do
	desc 'Initial Deploy'
	task :initial do
		on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
  
	after  :finishing,    :compile_assets
	after  :finishing,    :cleanup
end

task :seed do
  on roles(:app) do
    within release_path do
      execute :rake, "db:seed RAILS_ENV=production"
    end
  end
end

after 'deploy:migrating', 'seed'
