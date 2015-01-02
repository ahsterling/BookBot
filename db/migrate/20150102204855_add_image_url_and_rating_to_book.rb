class AddImageUrlAndRatingToBook < ActiveRecord::Migration
  def change
    add_column :books, :image_url, :string
    add_column :books, :rating, :string
  end
end
