class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references :user, null: false, foreign_key: true

      t.string :postcode, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building

      t.string :receiver, null: false

      t.timestamps
    end
  end
end
