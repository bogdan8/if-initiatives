# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# rails
gem 'breadcrumbs_on_rails'
gem 'cocoon'
gem 'draper'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 5.1.5'
gem 'ransack'
gem 'ruby-graphviz', require: 'graphviz'
gem 'simple_form'
gem 'state_machine'
gem 'time_difference'

# payment
gem 'liqpay', '~>1.0.0'

# for js
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.2.1'

# for style
gem 'bootstrap', '~> 4.1.1'
gem 'bootstrap4-kaminari-views'
gem 'font-awesome-rails'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'slim'

# for server
gem 'babosa'
gem 'dotenv-rails'
gem 'foreman'
gem 'friendly_id', '~> 5.1.0'
gem 'kaminari'
gem 'notifications', '~> 0.6.0'
gem 'paperclip', '~> 5.2.0'
gem 'puma', '~> 3.0'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'social-share-button'
gem 'unicode'

# for devise
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  # gem 'chromedriver-helper'
  gem 'capybara-screenshot'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'metric_fu', git: 'https://github.com/metricfu/metric_fu.git'
  gem 'parallel_tests'
  gem 'progress_bar'
  gem 'rack-mini-profiler'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', git: 'https://github.com/rubocop-hq/rubocop.git'
  gem 'rubycritic'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'brakeman'
  gem 'bullet'
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
  gem 'listen'
  gem 'rails_best_practices'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
