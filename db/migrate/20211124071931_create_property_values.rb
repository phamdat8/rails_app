class CreatePropertyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :property_values do |t|
      t.references :product_type, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
