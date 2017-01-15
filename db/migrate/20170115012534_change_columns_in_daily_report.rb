class ChangeColumnsInDailyReport < ActiveRecord::Migration[5.0]
  def change
    change_column :daily_reports, :nap_start, :time
    change_column :daily_reports, :nap_end, :time
  end
end
