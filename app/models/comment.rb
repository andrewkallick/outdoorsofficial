class Comment < ApplicationRecord
  # Direct associations

  belongs_to :brand

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    brand.to_s
  end
end
