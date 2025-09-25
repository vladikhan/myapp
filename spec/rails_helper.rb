# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

# Загружаем Rails
require_relative '../config/environment'

# Предотвращаем запуск тестов в production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/cuprite'
require 'active_support/testing/time_helpers'

# Подключаем FactoryBot
require 'factory_bot_rails'

# Загружаем все файлы из spec/support
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# Конфигурация Capybara для Cuprite
Capybara.javascript_driver = :cuprite
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  # FactoryBot методы без FactoryBot. prefix
  config.include FactoryBot::Syntax::Methods

  # Подключаем твой helper для feature-тестов
  config.include FeaturesSpecHelper, type: :feature

  # Подключаем login helpers для request specs
  config.include LoginHelpers, type: :request

  # Включаем travel_to
  config.include ActiveSupport::Testing::TimeHelpers

  # Используем транзакции для тестов с БД
  config.use_transactional_fixtures = true

  # Авто-дедупликация спеков
  config.infer_spec_type_from_file_location!

  config.include Devise::Test::IntegrationHelpers, type: :request


  # Фильтруем backtrace Rails-гемов
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  

  # Разрешаем host для request specs
  config.before(:suite) do
    Rails.application.config.hosts << "www.example.com"
    Rails.application.config.hosts << "baukis2.example.com"
    Rails.application.config.hosts << "127.0.0.1"
  end

  # Отключаем CSRF в request specs
  config.before(:each, type: :request) do
    allow_any_instance_of(ActionController::Base).to receive(:verify_authenticity_token).and_return(true)
  end
end
