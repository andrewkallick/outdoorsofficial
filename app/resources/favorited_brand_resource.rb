class FavoritedBrandResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :brand_id, :integer

  # Direct associations

  belongs_to :user,
             foreign_key: :brand_id

  # Indirect associations

end
