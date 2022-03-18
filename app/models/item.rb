class Item < ApplicationRecord
  has_many :comments
  has_one :order
  belongs_to :user


  
end
