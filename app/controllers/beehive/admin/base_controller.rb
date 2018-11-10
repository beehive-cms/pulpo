module Beehive
  module Admin
    class BaseController < ApplicationController
      before_action :authenticate_user!

      breadcrumb 'Home', :admin_root_path
    end
  end
end
