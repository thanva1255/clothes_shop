class Product < ApplicationRecord
  has_many :variants, -> { order(size: :ASC) }

  belongs_to :collection, optional: true
  belongs_to :category
end
