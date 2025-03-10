class Collection < ApplicationRecord
  has_many :products, -> { order(updated_at: :DESC) }
end
