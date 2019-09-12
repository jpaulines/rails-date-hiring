class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.geocoded
    end
  end
end
