class Product < ApplicationRecord
  has_many :variants
  belongs_to :collection, optional: true
end
