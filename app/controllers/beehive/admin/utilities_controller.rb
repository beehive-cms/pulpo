module Beehive
  module Admin
    class UtilitiesController < BaseController
      def reorder
        ids = params['ids']
        klass = params['model'].gsub('__', '/').classify.constantize
        authorize klass, :reorder?

        klass.find(ids).each do |item|
          position = ids.index(item.id.to_s) + 1
          item.update_attribute(:position, position)
        end

        head :ok
      end
    end
  end
end
