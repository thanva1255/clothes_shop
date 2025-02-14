class AddCollectionIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :collection, foreign_key: true
  end
end
