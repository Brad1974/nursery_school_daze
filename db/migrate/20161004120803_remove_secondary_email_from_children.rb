class RemoveSecondaryEmailFromChildren < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :secondary_email, :string
  end
end
