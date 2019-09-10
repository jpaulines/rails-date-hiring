class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.geocoded
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

end
