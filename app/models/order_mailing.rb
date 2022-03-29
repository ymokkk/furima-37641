class OrderMailing
  include ActiveModel::Model
  attr_accessor :address_number, :area_id, :sichoson, :banchi, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :address_number,
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が無効です。ハイフンを入れてください(例 123-4567)' }
    validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :sichoson
    validates :banchi
    validates :phone_number
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'が無効です。数字のみ入れてください' }
  validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/, message: 'の文字数が適切ではありません' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Mailing.create(address_number: address_number, area_id: area_id, sichoson: sichoson, banchi: banchi, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
