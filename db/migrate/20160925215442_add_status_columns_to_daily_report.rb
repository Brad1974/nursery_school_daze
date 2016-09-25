class AddStatusColumnsToDailyReport < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :complete, :boolean
    add_column :daily_reports, :sent, :boolean

  end
end
