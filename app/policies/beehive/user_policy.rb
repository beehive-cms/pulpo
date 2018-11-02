module Beehive
  class UserPolicy < ApplicationPolicy
    def index?
      user.roles.map(&:name).include? 'admin'
    end
  end
end
