class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.belongs_to :posts, index: true, null: false
      t.belongs_to :tags, index: true, null: false
    end
  end
end
