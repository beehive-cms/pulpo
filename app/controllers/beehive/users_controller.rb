module Beehive
  class UsersController < Beehive::ApplicationController
    include Pagy::Backend

    def index
      @pagy, @users = pagy(Beehive::User.all)
    end
  end
end
