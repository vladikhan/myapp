# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

# Подключаем все файлы из spec/support
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# Настройка Capybara для headless Chrome
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')        # новый headless режим
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')          # обязательно для Docker
  options.add_argument('--window-size=1920,1080')
  options.add_argument('--disable-dev-shm-usage') # предотвращает ошибки памяти в контейнере

  # Явно указываем путь к Chrome, если не в PATH (опционально)
  # options.binary = '/usr/bin/google-chrome' 

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 5 # секунд

# Проверяем наличие тестовой базы
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_path = Rails.root.join('spec/fixtures')
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include ActiveSupport::Testing::TimeHelpers

  # Для system-тестов с JS используем selenium_chrome_headless
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end

 
end