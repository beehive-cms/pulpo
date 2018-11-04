module Beehive
  class AppConfiguration < Preferences::Configuration
    preference :site_title, :string, default: 'Beehive'
  end
end
