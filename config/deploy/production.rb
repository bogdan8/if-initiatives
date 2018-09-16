set :stage, :production
set :branch, 'develop'
set :user, 'ubuntu'

role :app, %w{ubuntu@18.223.117.237}
role :web, %w{ubuntu@18.223.117.237}
role :db, %w{ubuntu@18.223.117.237}

server 'ubuntu@18.223.117.237', user: fetch(:user), roles: %w{app, web}, primary: true
ssh_options = {keys: ["#{ENV['HOME']}/.ssh/amazon.pem"], forward_agent: true }

set :deploy_to, "/home/#{fetch(:user)}"

set :rails_env, :production

set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

set :puma_init_active_record, true

set :enable_ssl, false

set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/if-initiatives-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/if-initiatives-puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/if-initiatives-puma.pid"
set :puma_access_log, "#{release_path}/log/if-initiatives-puma.error.log"
set :puma_error_log,  "#{release_path}/log/if-initiatives-puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
