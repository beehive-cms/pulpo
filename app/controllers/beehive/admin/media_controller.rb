module Beehive
  module Admin
    class MediaController < BaseController
      include Pagy::Backend

      breadcrumb 'Media', :admin_settings_path
      breadcrumb 'Add new', :new_admin_user_path, only: [:new, :create]

      def index
        authorize ActiveStorage::Blob

        @q = ActiveStorage::Blob.ransack(params[:q])
        @q.sorts = 'created_at desc' if @q.sorts.empty?
        results = @q.result(distinct: true)
        @pagy, @media = pagy(results)
      end

      def destroy
        media = find_media
        authorize media

        media.destroy
        redirect_to admin_media_path, notice: 'Media successfully removed'
      end

      private

      def find_media
        ActiveStorage::Blob.find(params[:id])
      end
    end
  end
end
