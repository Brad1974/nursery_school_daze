class CreateDailyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_reports do |t|
      t.date :date
      t.integer :child_id
      t.integer :poopy_diapers
      t.integer :wet_diapers
      t.text :narrative
      t.string :morning_snack
      t.string :lunch
      t.string :afternoon_snack
      t.text :clothing_needed
      t.text :other_needed
      t.boolean :need_diapers
      t.time :nap_start
      t.time :nap_end

      t.timestamps
    end
  end
end
