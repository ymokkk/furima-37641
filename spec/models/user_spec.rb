require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe '会員情報入力' do
      context '新規登録できる場合' do
        it 'nickname、email、password、password_confirmation、last_name、first_name、lastname_kana、firstname_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailに@がないと登録できない' do
          @user.email = "aamail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it '重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが半角英数字混合でなければ登録できない' do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '名字が空では登録できない' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it '名前が空では登録できない' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it '名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.last_name = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
        end
        it '名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
        end
        it 'フリガナ（名字）が空では登録できない' do
          @user.lastname_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
        end
        it 'フリガナ（名前）が空では登録できない' do
          @user.firstname_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
        end
        it '名字のフリガナは全角（カタカナ）でなれけば登録できない' do
          @user.lastname_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters.")
        end
        it '名前のフリガナは全角（カタカナ）でなれけば登録できない' do
          @user.firstname_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
        end
        it '生年月日が空では登録できない' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
    end
  end
end
