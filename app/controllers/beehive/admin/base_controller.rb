module Beehive
  module Admin
    class BaseController < ApplicationController
      before_action :authenticate_user!

      breadcrumb 'Home', :admin_users_path
    end
  end
end
