class ChildrenController < ApplicationController

  def index
    @children = Child.all
    @child = Child.new
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to children_path
    else
      render :new
    end
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to child_path(@child)
    else
      render :edit
    end
  end

  def destroy
    Child.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthdate, :email)
  end

end
