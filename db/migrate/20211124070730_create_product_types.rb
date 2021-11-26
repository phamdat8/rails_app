class CreateProductTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_types do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
