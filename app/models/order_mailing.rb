class OrderMailing
  include ActiveModel::Model
  attr_accessor :address_number, :area_id, :sichoson, :banchi, :building, :phone_number, :order

  with_options presence: true do
    validates :address_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :sichoson
    validates :banchi
    validates :phone_number
    validates :order
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user: user, item: item)
    Mailing.create(address_number: address_number, area_id:area.id, sichoson: sichoson, banchi: banchi, building: building, phone_number: phone_number)
  end
end
