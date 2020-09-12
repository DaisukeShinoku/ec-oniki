class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :receiver, null: false

      t.string :postcode, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building

      t.integer :payment_option, null: false
      t.integer :status, default: 1, null: false
      t.integer :postage, default: 800, null: false
      t.integer :billing, null: false

      t.timestamps
    end
  end
end
