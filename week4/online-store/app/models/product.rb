class Product < ActiveRecord::Base
  extend Rangable
  belongs_to :brand
  belongs_to :category
end