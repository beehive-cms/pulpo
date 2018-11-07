module Beehive
  module Admin
    class DashboardController < BaseController
      breadcrumb 'Dashboard', :admin_dashboard_path

      def index
      end
    end
  end
end
