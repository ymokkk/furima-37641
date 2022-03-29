class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :area
  belongs_to :shipping_day

  # has_many :comments
  has_one :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price
    validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :status_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :delivery_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'が無効です。半角で入力してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'が設定範囲外です' }
end
