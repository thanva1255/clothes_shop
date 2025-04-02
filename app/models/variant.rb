class Variant < ApplicationRecord
  belongs_to :product

  enum :size, [ :small, :medium, :large, :extra_large ]

  scope :by_product_id, ->(product_id) { where(product_id: product_id) }
end
