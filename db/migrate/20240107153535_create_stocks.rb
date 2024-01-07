class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
