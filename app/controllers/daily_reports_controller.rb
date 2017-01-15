class DailyReportsController < ApplicationController
  before_action :set_child
  before_action :set_daily_report, except: [:index, :new, :create]

  def show
    authorize @daily_report
  end

  def index
    redirect_to child_path(@child)
  end

  def new
    @daily_report = @child.daily_reports.build
    authorize @daily_report
  end

  def create
    @daily_report = @child.daily_reports.build(daily_report_params)
    authorize @daily_report
    if @daily_report.save
      redirect_to child_daily_report_path(@child, @daily_report), notice: "report generated"
    else
      render :new
    end
  end

  def communicate
    if @daily_report.complete
      ReportMailer.report_email(@daily_report).deliver
      @daily_report.update(emailed: true)
      redirect_to child_path(@child), notice: "report emailed"
    else
      redirect_to child_daily_report_path(@child, @daily_report), notice: "report must be complete before you can email"
    end
  end

  def edit
    authorize @daily_report
  end

  def update
    authorize @daily_report
    if @daily_report.update(daily_report_params)
      @daily_report.save
      redirect_to child_daily_report_path(@child, @daily_report), notice: "report updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @daily_report
    @daily_report.destroy
    redirect_to root_path
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:child_id, :date, :wet_diapers, :poopy_diapers, :morning_snack, :lunch, :afternoon_snack, :clothing_needed, :need_diapers, :other_needed, :nap_start, :nap_end, :narrative, :narrative1, :narrative2, :narrative3, :narrative4, :no_nap_today, :complete, kind_acts_attributes: [:id, :_destroy, :act, :giver_id, :recipient_id, :daily_report_id])
  end


  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_daily_report
    @daily_report = @child.daily_reports.find(params[:id])
  end
end
