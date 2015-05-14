class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title, index: true, null: false
      t.string :url, index: true, null: false

      t.timestamps null: false
    end
  end
end
