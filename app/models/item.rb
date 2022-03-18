class Item < ApplicationRecord
  has_many :comments
  has_one :order
  belongs_to :user


  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_id, presence: true
  validates :area_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
end
