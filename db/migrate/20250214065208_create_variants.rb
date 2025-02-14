class CreateVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :variants do |t|
      t.integer :size, null: false
      t.belongs_to :product, null: false, foreign_key: true
      t.float :price, default: 0
      t.string :image_url
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
