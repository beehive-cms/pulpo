module Beehive
  module Admin
    class UsersController < Beehive::ApplicationController
      include Pagy::Backend

      def index
        authorize User

        @q = User.ransack(params[:q])
        results = @q.result(distinct: true).includes(:roles)
        @pagy, @users = pagy(results)
      end
    end
  end
end
