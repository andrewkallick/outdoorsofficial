class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :brand_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :brand

  belongs_to :user

  # Indirect associations
end
