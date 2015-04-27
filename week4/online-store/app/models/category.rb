class Category < ActiveRecord::Base
  extend Rangable
  has_many :products
end