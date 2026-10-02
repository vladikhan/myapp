source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gem "logger"

ruby "~> 3.1.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.7", ">= 6.1.7.6"
# Use sqlite3 as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Use SCSS for stylesheet
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.4"

gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

gem "validates_timeliness", "~> 6.0"

gem "valid_email2"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem "factory_bot_rails"
end

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console", ">= 4.1.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

gem "kaminari", "~> 1.2.2"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "dartsass-rails", "~> 0.5.1"
# gem 'sass-rails', '~> 6.0.0'
# gem 'sassc-rails', '~> 2.1.0'

gem "sprockets-rails"
