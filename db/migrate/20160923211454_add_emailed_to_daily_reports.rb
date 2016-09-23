class AddEmailedToDailyReports < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :emailed, :boolean
  end
end
