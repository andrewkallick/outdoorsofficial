class Brand < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
