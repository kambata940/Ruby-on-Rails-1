class ChangePostsTags < ActiveRecord::Migration
  def change
    remove_column :posts_tags, :tags_id, :integer, index: true, null: false
    add_column :posts_tags, :tag_id, :integer, index: true
    remove_column :posts_tags, :posts_id, :integer, index: true, null: false
    add_column :posts_tags, :post_id, :integer, index: true
  end
end