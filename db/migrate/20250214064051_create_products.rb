class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
