if Rails.env.test?
  require 'webdrivers'
  
  # Отключаем автоматическое скачивание драйверов в тестовой среде
  Webdrivers.install_dir = '/tmp/webdrivers_disabled'
  Webdrivers.cache_time = 0
  
  # Переопределяем методы для отключения проверок
  module Webdrivers
    class Chromedriver
      def self.update
        # Ничего не делаем
      end
      
      def self.current_version
        Gem::Version.new('1.0.0')
      end
    end
  end
end
