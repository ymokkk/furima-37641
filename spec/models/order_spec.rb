require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_mailing = FactoryBot.build(:order_mailing, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'tokenや全ての情報があれば保存ができること' do
      expect(@order_mailing).to be_valid
    end
  end
  
  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order_mailing.token = nil
      @order_mailing.valid?
      expect(@order_mailing.errors.full_messages).to include("Token can't be blank")
    end
end
