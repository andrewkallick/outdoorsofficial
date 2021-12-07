class BrandResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string
  attribute :image, :string
  attribute :sport, :string
  attribute :category, :string
  attribute :pricepoint, :string
  attribute :highlyrated, :string

  # Direct associations

  has_many   :comments

  # Indirect associations

end
