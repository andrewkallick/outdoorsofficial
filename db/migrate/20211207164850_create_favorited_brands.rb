class CreateFavoritedBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :favorited_brands do |t|
      t.integer :brand_id

      t.timestamps
    end
  end
end
