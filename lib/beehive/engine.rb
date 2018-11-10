module Beehive
  class Engine < ::Rails::Engine
    isolate_namespace Beehive

    # sets the manifests / assets to be precompiled, even when initialize_on_precompile is false
    initializer 'beehive.assets.precompile', group: :all do |app|
      app.config.assets.precompile += %w[
        beehive/all*
      ]
    end

    initializer 'beehive.environment', before: :load_config_initializers do
      Beehive::Config = Beehive::AppConfiguration.new
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.to_prepare do
      Devise::SessionsController.layout 'beehive/devise'
    end
  end
end
