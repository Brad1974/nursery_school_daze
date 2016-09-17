class ChangeColumnInDailyReports < ActiveRecord::Migration[5.0]
  def change
    change_column :daily_reports, :nap_start, :time, default: '2016-01-01 13:00:00'
    change_column :daily_reports, :nap_end, :time, default: '2016-01-01 13:00:00'
  end
end
