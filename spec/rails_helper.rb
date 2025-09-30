# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'

# Monkey patch для ошибки "Blocked host"
module ActionDispatch
  class HostAuthorization
    def call(env)
      @app.call(env)
    end
  end
end

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/cuprite'
require 'capybara/rails'
require 'active_support/testing/time_helpers'
require 'factory_bot_rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

Capybara.javascript_driver = :cuprite
Capybara.default_max_wait_time = 5
Capybara.default_driver = :rack_test

RSpec.configure do |config|
  # Отключаем встроенный механизм очистки RSpec, чтобы избежать конфликтов с database_cleaner.
  config.use_transactional_fixtures = false

  # Настройка DatabaseCleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # --- ВОТ СТРОКА, КОТОРАЯ ИСПРАВИТ ОШИБКУ `NoMethodError` ---
  config.include FeaturesSpecHelper, type: :feature

  # Включаем синтаксис FactoryBot (например, create(:user))
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end