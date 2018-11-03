module Beehive
  module Admin
    class UsersController < BaseController
      include Pagy::Backend

      breadcrumb 'Admin', :admin_users_path
      breadcrumb 'Users', :admin_users_path

      def index
        authorize User

        @q = User.ransack(params[:q])
        results = @q.result(distinct: true).includes(:roles)
        @pagy, @users = pagy(results)
      end
    end
  end
end
