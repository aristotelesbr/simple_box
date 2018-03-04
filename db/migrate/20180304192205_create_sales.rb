class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :buyer, null: false
      t.text :description, null: false
      t.decimal :unit_price, precision: 14, scale: 2
      t.integer :quantity, null: false
      t.string :supplier, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
