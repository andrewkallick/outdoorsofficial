class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :sport
      t.string :category
      t.string :pricepoint
      t.string :highlyrated

      t.timestamps
    end
  end
end
