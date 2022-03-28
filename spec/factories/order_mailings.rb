FactoryBot.define do
  factory :order_mailing do
    address_number {'123-4567'}
    area_id {2}
    sichoson {'札幌市'}
    banchi {'青山1-1'}
    building {'東京ハイツ'}
    phone_number {'09012345678'}
    token {"tok_2a7e0f8a201af4f3524d9b187031"}
  end
end
