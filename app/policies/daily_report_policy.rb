class DailyReportPolicy < ApplicationPolicy

  def show?
    @user.guide? || @user.admin? || @user.children.find{|c| c.id == record.child_id}
    # || @user.children.include?(record)
  end

  def new?
    @user.guide? || @user.admin?
  end

  def create?
    @user.guide? || @user.admin?
  end

  def communicate?
    @user.guide || @user.admin?
  end
  #
  def edit?
    @user.guide? || @user.admin?
    # || @user.children.include?(record)
  end
  #
  def update?
    @user.guide? || @user.admin?
  end

  def destroy?
    @user.guide? || @user.admin?
  end

  # class Scope
  #   attr_reader :user, :scope
  #
  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end
  #
  #   def resolve
  #     if user.admin?
  #       scope.all
  #     else
  #       scope.where(user: user)
  #     end
  #   end
  #
  # end


end
