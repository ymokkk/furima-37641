class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :area
  belongs_to :shipping_day

  has_many :comments
  has_one :order
  belongs_to :user
  has_one_attached :image



  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
end
