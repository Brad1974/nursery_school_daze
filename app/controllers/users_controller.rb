class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.new
    @children = @user.children
    authorize @user
  end

  def create
    @user = User.new(secure_params)
    @user.children << Child.find(params[:user][:child_ids][0])

    if @user.save
      redirect_to users_path, :notice => "User Created."
    else
      render 'users/index'
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :first_name, :last_name, :email, :password, :password_confirmation, child_ids: [], children_attributes: [:first_name, :last_name, :birthdate])
  end

end
