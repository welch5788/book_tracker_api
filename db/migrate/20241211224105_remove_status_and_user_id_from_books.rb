class RemoveStatusAndUserIdFromBooks < ActiveRecord::Migration[8.0]
  def change
    remove_column :books, :status, :string
    remove_column :books, :user_id, :integer
  end
end
