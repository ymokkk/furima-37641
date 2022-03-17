FactoryBot.define do
  
  factory :user do
    nickname {"test"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"山田"}
    lastname_kana {"ヤマダ"}
    first_name {"太郎"}
    firstname_kana {"タロウ"}
    birthday {"2000-01-01"}
  end
end
