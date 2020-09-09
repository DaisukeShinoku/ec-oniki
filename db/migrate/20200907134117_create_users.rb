class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :account_id, null: false
      t.string :password_digest, null: false

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_roman, null: false
      t.string :last_name_roman, null: false

      t.date :birthday, null: false

      t.string :postcode, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building

      t.string :nickname, unique: true
      t.boolean :is_valid, default:true, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :account_id, unique: true
  end
end
