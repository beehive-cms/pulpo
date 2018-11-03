module Beehive
  module Admin
    class BaseController < ApplicationController
      breadcrumb 'Home', :admin_users_path
    end
  end
end
