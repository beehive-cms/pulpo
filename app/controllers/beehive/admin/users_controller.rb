module Beehive
  module Admin
    class UsersController < BaseController
      include Pagy::Backend

      breadcrumb 'Settings', :admin_settings_path
      breadcrumb 'Users', :admin_users_path

      def index
        authorize User

        @q = User.ransack(params[:q])
        results = @q.result(distinct: true).includes(:roles)
        @pagy, @users = pagy(results)
      end

      def edit
        @user = find_user
        authorize @user
        breadcrumb @user.decorate.to_s, admin_user_path(@user)
      end

      def update
        @user = find_user
        authorize @user
        breadcrumb @user.to_s, admin_user_path(@user)

        clear_blank_password_params!

        if @user.update_attributes(user_attributes)
          redirect_to edit_admin_user_path(@user)
        else
          render :edit
        end
      end

      private

      def find_user
        User.find(params[:id])
      end

      def user_attributes
        params.require(:user).permit(:email, :password, :password_confirmation, role_ids: [])
      end

      def clear_blank_password_params!
        params[:user].delete(:password) if params[:user][:password].blank?
        params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      end
    end
  end
end
