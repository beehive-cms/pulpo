module Beehive
  module Api
    module V1
      class MediumResource < JSONAPI::Resource
        model_name 'ActiveStorage::Blob'

        attributes :created_at

        attribute :filename
        attribute :sizes

        def filename
          @model.filename.to_s
        end

        def sizes
          {
            # @todo this doesn't seem to be a proper way of generating AS urls
            original: '/rails' + Rails.application.routes.url_helpers.rails_blob_path(@model, host: '')
          }
        end
      end
    end
  end
end
