require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

if ENV['SELENIUM_URL']
  puts "Using Selenium Grid at #{ENV['SELENIUM_URL']}"
  
  Capybara.register_driver :selenium_remote_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1400,1400')

    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV['SELENIUM_URL'],
      options: options
    )
  end

 require 'capybara/rspec'



Capybara.default_max_wait_time = 5
  
  # ВАЖНО: настройки для Docker сети
  Capybara.server_host = '0.0.0.0'  # Rails слушает на всех интерфейсах
  Capybara.server_port = 3001
  
  # Chrome обращается к Rails по внутреннему имени Docker контейнера
  Capybara.app_host = "http://web:3001"
  
  Capybara.default_max_wait_time = 10
else
  Capybara.default_driver = :rack_test
  Capybara.javascript_driver = :rack_test
end
