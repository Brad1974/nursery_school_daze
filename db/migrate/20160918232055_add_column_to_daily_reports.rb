class AddColumnToDailyReports < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :no_nap_today, :boolean
  end
end
