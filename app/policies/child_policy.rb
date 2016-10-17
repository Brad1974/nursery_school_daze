class ChildPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    @user.guide? || @user.admin? || @user.children.include?(record)
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.guide?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

end
