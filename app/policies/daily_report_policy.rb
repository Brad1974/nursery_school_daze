class DailyReportPolicy < ApplicationPolicy

  def show?
    @user.guide? || @user.admin? || @user.children.find{|c| c.id == record.child_id}
  end

  def new?
    @user.guide? || @user.admin?
  end

  def create?
    @user.guide? || @user.admin?
  end

  def communicate?
    # there is proper authority, the report has not yet been emailed,
    # and the child has a parent associated with them to receive the email
    (@user.guide? || @user.admin?) && !record.emailed && record.child.user
  end

  def edit?
    @user.guide? || @user.admin?
  end

  def update?
    # there is proper authority, and the report has not yet been emailed
    (@user.guide? || @user.admin?) && !record.emailed
  end

  def destroy?
    @user.guide? || @user.admin?
  end

end
