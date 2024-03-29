Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.secret_key = ENV['DEVISE_SECRET_KEY']

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  config.log_level = :debug
  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           587,
    authentication: :plain,
    user_name:      ENV['EMAIL_USER'],
    password:       ENV['EMAIL_PASSWORD'],
    openssl_verify_mode:  'none'
  }

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
