class OrderMailing
  include ActiveModel::Model
  attr_accessor :address_number, :area_id, :sichoson, :banchi, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :address_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :sichoson
    validates :banchi
    validates :phone_number
    validates :item_id
    validates :user_id
  end
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input only number"}
    validates :phone_number, format: {with: /\A0[0-9]{9,10}\z/, message:"is too short"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Mailing.create(address_number: address_number, area_id:area_id, sichoson: sichoson, banchi: banchi, building: building, phone_number: phone_number, order_id: order.id)
  end
end
