module Beehive
  module Admin
    class GeneralSettingsController < BaseController
      def edit
        @general_settings = GeneralSettingsForm.new
      end

      def update
        @general_settings = GeneralSettingsForm.new(general_settings_params)

        if @general_settings.valid?
          @general_settings.save
          flash[:success] = t(:successfully_updated, resource: t(:general_settings))
          redirect_to edit_admin_general_settings_path
        else
          render :edit
        end
      end

      private

      def general_settings_params
        params.require(:general_settings_form).permit(:site_title)
      end
    end
  end
end
