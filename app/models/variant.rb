class Variant < ApplicationRecord
  belongs_to :product

  enum :size, [ :s, :m, :l, :xl ]
end
