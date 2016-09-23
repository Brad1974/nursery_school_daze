class ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child, except: [:index, :new, :create]

  def index
    @children = policy_scope(Child)
  end

  def show
    authorize @child
  end

  def new
    @child = Child.new
    authorize @child
  end

  def create
    @child = Child.new(child_params)
    authorize @child
    if @child.save
      redirect_to children_path
    else
      render :new
    end
  end

  def edit
    authorize @child
  end

  def update
    authorize @child
    if @child.update(child_params)
      redirect_to child_path(@child)
    else
      render :edit
    end
  end

  def destroy
    authorize @child
    @child.destroy
    redirect_to root_path
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthdate, :email, :secondary_email, :user_id)
  end

  def set_child
    @child = Child.find(params[:id])
  end

end
