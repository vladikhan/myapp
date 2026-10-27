require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/cuprite'


if ENV['SELENIUM_URL']
  puts "Using Selenium Grid at #{ENV['SELENIUM_URL']}"
  
  Capybara.register_driver(:curpite) do |app|
    Capybara::Curpite::Driver.new(app, {
      headless: true,
      js_errors: false,
      process_timeout: 10, 
      browser_options: {
        'no-sandbox' =>  nil,
        'disable-dev-shm-usage' => nil 
        }
    })
  end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :cuprite
Capybara.default_max_wait_time = 5
  
  # ВАЖНО: настройки для Docker сети
  Capybara.server_host = '0.0.0.0'  # Rails слушает на всех интерфейсах
  Capybara.server_port = 3001
  
  # Chrome обращается к Rails по внутреннему имени Docker контейнера
  Capybara.app_host = "http://web:3001"
  
else
  Capybara.default_driver = :rack_test
  Capybara.javascript_driver = :curpite
end
