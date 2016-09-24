class AddNarrativeColumnstoDailyReport < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :narrative1, :text
    add_column :daily_reports, :narrative2, :text
    add_column :daily_reports, :narrative3, :text
    add_column :daily_reports, :narrative4, :text
  end
end
