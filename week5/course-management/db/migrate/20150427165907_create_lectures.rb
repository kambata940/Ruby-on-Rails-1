class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.text :name, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
