class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :production_status, null: false,default: 0

      t.timestamps
    end
  end
end
