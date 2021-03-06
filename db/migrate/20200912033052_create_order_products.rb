class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :work_status, default: 1, null: false

      t.timestamps
    end
  end
end
