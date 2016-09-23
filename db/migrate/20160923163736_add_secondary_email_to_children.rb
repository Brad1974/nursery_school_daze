class AddSecondaryEmailToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :email2, :string
  end
end
