class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :brand, index: true
      t.belongs_to :category, index: true
      t.text :name, null: false
      t.decimal :price, null: false
      t.integer :quantity, null: false
    end
  end
end
