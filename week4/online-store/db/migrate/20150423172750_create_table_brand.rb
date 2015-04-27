class CreateTableBrand < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.text :name
      t.text :description
    end
  end
end
