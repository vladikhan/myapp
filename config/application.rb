require_relative "boot"
require "sprockets/railtie"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1


 config.assets.css_compressor = nil
    config.assets.enabled = true

    config.autoload_paths << Rails.root.join('app/forms')


    config.time_zone ="Tokyo"
    config.i18n.load_path +=
    Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.skip_routes true
      g.helper  false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false 
      g.view_specs false

    end
  end
end
