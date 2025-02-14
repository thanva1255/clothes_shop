class AddCategoryIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :category, foreign_key: true, default: 0
  end
end
