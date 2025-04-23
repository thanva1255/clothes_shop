class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
