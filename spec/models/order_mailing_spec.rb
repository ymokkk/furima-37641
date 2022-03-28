require 'rails_helper'

RSpec.describe OrderMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_mailing = FactoryBot.build(:order_mailing, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入内容の確認' do
    context '商品購入がうまくいくとき' do
      it 'tokenや全ての値が正しく入力されていれば保存できること' do
        expect(@order_mailing).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_mailing.building = nil
        expect(@order_mailing).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @order_mailing.token = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Token can't be blank")
      end
      it 'address_numberが空では保存できない' do
        @order_mailing.address_number = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Address number can't be blank")
      end
      it 'address_numberにハイフンがないと保存できない' do
        @order_mailing.address_number = '1234567'
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include('Address number is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'area_idが未選択では保存できない' do
        @order_mailing.area_id = 1
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Area can't be blank")
      end
      it 'sichosonが空では保存できない' do
        @order_mailing.sichoson = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Sichoson can't be blank")
      end
      it 'banchiが空では保存できない' do
        @order_mailing.banchi = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Banchi can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_mailing.phone_number = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角では保存できない' do
        @order_mailing.phone_number = 'あああああああああああ'
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが9文字以下では保存できない' do
        @order_mailing.phone_number = '090123456'
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include('Phone number is too short')
      end
      it 'userが紐付いていなければ保存できない' do
        @order_mailing.user_id = nil
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
