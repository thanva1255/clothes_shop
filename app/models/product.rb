class Product < ApplicationRecord
  has_many :variants

  belongs_to :collection, optional: true
  belongs_to :category
end
