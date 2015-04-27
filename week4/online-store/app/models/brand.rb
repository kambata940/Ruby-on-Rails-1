class Brand < ActiveRecord::Base
  extend Rangable
  has_many :products
end