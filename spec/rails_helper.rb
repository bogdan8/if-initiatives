# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

Rails.application.routes.default_url_options[:host] = 'localhost:5000'

require 'devise'
require 'rspec/rails'
require 'shoulda/matchers'
require 'paperclip/matchers'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].map { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium

Capybara::Screenshot.s3_configuration = {
  s3_client_credentials: {
    access_key_id: ENV['AMAZONE_KEY_ID'],
    secret_access_key: ENV['AMAZONE_SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  },
  bucket_name: 'initiative-if'
}

# Capybara.configure do |config|
#  config.default_driver = :selenium
# end

Capybara.ignore_hidden_elements = false

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.before(:each, type: :feature) do
    Capybara::Session.new(:selenium)
    I18n.locale = :uk
    # Capybara.current_session.current_window.resize_to(2_500, 2_500)
    default_url_options[:locale] = :uk
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Capybara::DSL
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
