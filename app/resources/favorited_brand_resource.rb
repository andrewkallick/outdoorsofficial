class FavoritedBrandResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :brand_id, :integer

  # Direct associations

  # Indirect associations

end
