module Beehive
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable,
           :recoverable, :rememberable, :validatable

    has_many :role_users
    has_many :roles, through: :role_users

    def to_s
      email
    end

    def role?(role)
      roles.where(name: role.to_s).any?
    end
  end
end
