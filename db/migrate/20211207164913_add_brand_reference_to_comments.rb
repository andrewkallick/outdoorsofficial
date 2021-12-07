class AddBrandReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :brands
    add_index :comments, :brand_id
    change_column_null :comments, :brand_id, false
  end
end
