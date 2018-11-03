module Beehive
  module Api
    module V1
      class UserResource < JSONAPI::Resource
        model_name 'Beehive::User'

        attributes :email, :created_at, :updated_at

        has_many :roles

        def fetchable_fields
          if context[:current_user].blank?
            super - [:email]
          else
            super
          end
        end
      end
    end
  end
end
