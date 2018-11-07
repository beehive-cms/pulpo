module Beehive
  class GeneralSettingsForm
    include ActiveModel::Model

    # Define a list of editable settings
    SETTING_KEYS = %i[
      site_title
      site_description
    ].freeze

    # Generate accessors for all the setting keys
    SETTING_KEYS.each do |key|
      attr_accessor key
    end

    # Set validations
    validates :site_title, presence: true

    def initialize(attrs = {})
      loaded =
        SETTING_KEYS.each_with_object({}) do |key, hsh|
          hsh[key] = Beehive::Config[key]
        end

      assign_attributes(loaded.merge(attrs))
    end

    def save
      SETTING_KEYS.each { |key| Beehive::Config[key] = send(key) }
    end
  end
end
