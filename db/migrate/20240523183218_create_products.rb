class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :merchant, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantities
      t.decimal :selling_price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
