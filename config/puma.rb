# Change to match your CPU core count
workers 2

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
# Default to production
rails_env = 'production'
environment rails_env

# Set up socket location
bind 'unix:///home/ubuntu/shared/tmp/sockets/if-initiatives-puma.sock'
# Logging
stdout_redirect 'log/if-initiatives-puma.error.log', 'log/if-initiatives-puma.access.log', true

# Set master PID and state locations
pidfile '/home/ubuntu/shared/tmp/pids/if-initiatives-puma.pid'
state_path '/home/ubuntu/shared/tmp/pids/if-initiatives-puma.state'
activate_control_app

on_worker_boot do
  require 'active_record'
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end
