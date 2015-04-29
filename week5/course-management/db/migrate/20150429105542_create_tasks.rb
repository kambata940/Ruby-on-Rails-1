class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.belongs_to :lecture, index: true

      t.timestamps null: false
    end
  end
end
