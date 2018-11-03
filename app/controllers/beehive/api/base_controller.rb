module Beehive
  module Api
    class BaseController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def context
        { current_user: current_user }
      end
    end
  end
end
