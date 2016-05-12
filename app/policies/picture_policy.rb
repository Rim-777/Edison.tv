class PicturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    !!user
  end

  def destroy?
    user && user == record.user
  end
end
