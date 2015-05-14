class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  def find_tags
    body.scan(/#(\w+)/).map { |e| e[0] }
  end
end
