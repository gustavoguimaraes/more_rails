require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module SoccerCup
  class Application < Rails::Application

    # Required for using Devise on Heroku
    config.assets.initialize_on_precompile = false

    # Add active_admin assets
    config.assets.precompile += %w[ admin.css
                                    admin.js
                                    admin/active_admin.css
                                    admin/active_admin.js
                                    *.png
                                    *.jpg
                                    *.jpeg
                                    *.gif
                                    *.svg
                                    *.eot
                                    *.woff
                                    *.ttf
                                ]

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.compile = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
