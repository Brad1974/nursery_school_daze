class ChangeColumnsInChildren < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :email
    rename_column :children, :email2, :secondary_email
  end
end
