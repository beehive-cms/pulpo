module Beehive
  class CreateUserForm
    include ActiveModel::Model

    attr_accessor :email, :password, :password_confirmation, :role_ids, :send_password_instructions

    delegate :valid?,
             :errors,
             to: :user

    def initialize(*args)
      @role_ids ||= []
      super
    end

    def save
      user.save
    end

    def user
      @user ||= User.new(
        email: email,
        role_ids: role_ids,
        password: password,
        password_confirmation: password_confirmation
      )
    end
  end
end
