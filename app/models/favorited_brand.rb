class FavoritedBrand < ApplicationRecord
  # Direct associations

  belongs_to :user,
             foreign_key: "brand_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
