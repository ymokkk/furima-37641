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

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank" } do
  validates :category_id
  validates :status_id
  validates :delivery_id
  validates :area_id
  validates :shipping_day_id
  end

  validates :price, numericality: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
