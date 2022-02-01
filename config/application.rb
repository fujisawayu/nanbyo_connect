require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module NanbyoConnect
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
  end
end
