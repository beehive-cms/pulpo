module Beehive
  module Admin
    class UsersController < Beehive::ApplicationController
      include Pagy::Backend

      def index
        authorize User
        @pagy, @users = pagy(User.all)
      end
    end
  end
end
