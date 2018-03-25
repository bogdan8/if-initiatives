source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# rails
gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'

# for js
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.2.1'

# for style
gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'

# for server
gem 'babosa'
gem 'dotenv-rails'
gem 'friendly_id', '~> 5.1.0'
gem 'kaminari'
gem 'paperclip', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sidekiq'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'social-share-button'
gem 'chewy'
gem 'unicode'

# for devise
gem 'cancancan'
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'
gem 'rolify'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'parallel_tests'
  gem 'progress_bar'
  gem 'rack-mini-profiler'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-rails-console', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
