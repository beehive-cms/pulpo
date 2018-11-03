module Beehive
  class AppConfiguration < Preferences::Configuration
    preference :currency, :string, default: 'USD'
  end
end
