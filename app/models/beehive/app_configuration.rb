module Beehive
  class AppConfiguration < Preferences::Configuration
    preference :site_title, :string, default: 'Beehive'
    preference :site_description, :string, default: 'Powered by Beehive CMS'
  end
end
