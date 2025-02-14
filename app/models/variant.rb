class Variant < ApplicationRecord
  belongs_to :product

  enum :size, [ :small, :medium, :large, :extra_large ]
end
