module Beehive
  class Engine < ::Rails::Engine
    isolate_namespace Beehive

    initializer 'beehive.environment', before: :load_config_initializers do
      Beehive::Config = Beehive::AppConfiguration.new
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
