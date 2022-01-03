# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.0.1'
gem 'aasm', '~> 5.2'
gem 'activeadmin', '~> 2.9'
gem 'aws-sdk-s3', '~> 1.109'
gem 'blueprinter', '~> 0.25.3'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '>= 4.8'
gem 'factory_bot_rails', '~> 6.2.0'
gem 'faker', '~> 2.19.0'
gem 'file_validators', '~> 3.0'
gem 'haml-rails', '~> 2.0'
gem 'image_processing', '~> 1.12'
gem 'jbuilder', '~> 2.7'
gem 'kaminari', '~> 1.2'
gem 'letter_opener', '~> 1.4'
gem 'mini_magick', '~> 4.11'
gem 'omniauth-facebook', '~> 9.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~> 6.3'
gem 'sidekiq-cron', '~> 1.2'
gem 'slim'
gem 'travis', '~> 1.8.13'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'bullet', '~> 7.0'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring', '~> 3.0'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'rails-controller-testing', '>= 1.0.5'
  gem 'rspec-rails', '>= 5.0.2'
  gem 'selenium-webdriver', '>= 4.1.0'
  gem 'webdrivers', '>= 5.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
