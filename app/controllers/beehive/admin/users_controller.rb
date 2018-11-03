module Beehive
  module Admin
    class UsersController < Beehive::ApplicationController
      include Pagy::Backend

      def index
        authorize User
        @q = User.ransack(params[:q])
        @pagy, @users = pagy(@q.result(distinct: true))
      end
    end
  end
end
