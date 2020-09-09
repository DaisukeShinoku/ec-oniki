class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :name, null: false
      t.text :introduction
      t.integer :price, null: false
      t.string :image
      t.boolean :is_valid, default:true, null: false
      t.timestamps
    end
  end
end
