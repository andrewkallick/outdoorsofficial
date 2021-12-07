class AddUserReferenceToFavoritedBrands < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorited_brands, :users, column: :brand_id
    add_index :favorited_brands, :brand_id
    change_column_null :favorited_brands, :brand_id, false
  end
end
