class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :genre
      t.float :rating
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
