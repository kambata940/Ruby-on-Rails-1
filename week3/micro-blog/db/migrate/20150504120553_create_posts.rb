class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, index: true, null: false
      t.string :body, index: true, null: false

      t.timestamps null: false
    end
  end
end
