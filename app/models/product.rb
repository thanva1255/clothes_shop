class Product < ApplicationRecord
  has_many :variants, -> { order(size: :ASC) }, dependent: :destroy

  belongs_to :collection, optional: true
  belongs_to :category

  scope :by_category_id, ->(category_id) { category_id.present? ? where(category_id:) : all }
end
