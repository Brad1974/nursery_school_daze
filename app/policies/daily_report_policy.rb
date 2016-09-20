class DailyReportPolicy < ApplicationPolicy

  # def index?
  #   true
  # end

  def show?
    binding.pry
    @user.admin? || @user.children.find{|c| c.id == record.child_id}
    # || @user.children.include?(record)
  end

  # def new?
  #   @user.admin?
  # end
  #
  # def create?
  #   @user.admin?
  # end
  #
  def edit?
    @user.admin? || @user.children.find{|c| c.id == record.child_id}
    # || @user.children.include?(record)
  end
  #
  # def update?
  #   @user.admin? || @user.children.include?(record)
  # end
  #
  # def destroy
  #   @user.admin?
  # end
  #
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
