class DailyReportsController < ApplicationController
  before_action :set_child

  def show
    @daily_report = @child.daily_reports.find(params[:id])
  end

  def index
    redirect_to child_path(@child)
  end

  def new
    @daily_report = @child.daily_reports.build
  end

  def create
    binding.pry
    @daily_report = @child.daily_reports.build(daily_report_params)
    if @daily_report.save
      redirect_to child_daily_report_path(@child, @daily_report), notice: "report generated"
    else
      render :new
    end
  end

  def edit
    @daily_report = @child.daily_reports.find(params[:id])
  end

  def update
    @daily_report = @child.daily_reports.find(params[:id])
    if @daily_report.update(daily_report_params)
      @daily_report.save
      redirect_to child_daily_report_path(@child, @daily_report), notice: "report updated"
    else
      render :edit
    end
  end

  def destroy
    @child.daily_reports.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:child_id, :date, :wet_diapers, :poopy_diapers, :morning_snack, :lunch, :afternoon_snack, :clothing_needed, :need_diapers, :other_needed, :nap_start, :nap_end, :narrative, kind_acts_attributes: [:id, :_destroy, :act, :giver_id, :recipient_id, :daily_report_id])
  end


  def set_child
    @child = Child.find(params[:child_id])
  end
end
