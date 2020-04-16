class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.references :member, foreign_key: true, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
