class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :items
  has_many :comments
  has_many :orders

         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :lastname_kana, presence: true
         validates :firstname_kana, presence: true
         validates :birthday, presence: true
         
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end