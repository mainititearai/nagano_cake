class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member, foreign_key: true
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :postage, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false,default: 0

      t.timestamps
    end
  end
end
