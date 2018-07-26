# frozen_string_literal: true

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end
