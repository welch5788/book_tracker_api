class RenameRatingToAverageRating < ActiveRecord::Migration[8.0]
  def change
    rename_column :books, :rating, :average_rating
  end
end
