require 'rails_helper'

describe User do
 before do
   @user = FactoryBot.build(:user)
 end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録出来るとき' do
      it 'nicknameが存在すれば登録出来る' do
        @user.nickname = "太郎furima"
        expect(@user).to be_valid
      end
      it '@を含んだemailが存在する場合は登録出来る' do
        @user.email = "sample29365@gmail.com"
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合、6文字以上で存在すれば登録出来る' do
        @user.password = "29365furima"
        @user.password_confirmation = "29365furima"
        expect(@user).to be_valid
      end
      it 'ユーザー本名のfirst_name, last_nameが全角文字で存在すれば登録出来る' do
        @user.first_name = "海田"
        @user.last_name = "海"
        expect(@user).to be_valid
      end
      it 'ユーザー本名のfirst_name_kana, last_name_kanaが全角(カタカナ)で存在すれば登録出来る' do
        @user.first_name_kana = "ウミタ"
        @user.last_name_kana = "カイ"
        expect(@user).to be_valid
      end
      it 'birth_dateが存在する場合は登録出来る' do
        @user.birth_date = "2000-12-31"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録出来ないとき' do
      it 'nicknameが空の場合は登録出来ない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが重複している場合は登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it '@を含んだemailが存在しなければ登録出来ない' do
        @user.email = "sample29365gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordは6文字以上でなければ登録出来ない' do
        @user.password = "pass1"
        @user.password_confirmation = "pass1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合でなければ登録出来ない(英字のみ)' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは半角英数字混合でなければ登録出来ない(数字のみ)' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordが存在しても、password_confirmationが空の場合は登録出来ない' do
        @user.password = "29365furima"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名のfirst_nameが空の場合は登録出来ない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名のfirst_nameが全角文字で存在しない場合は登録出来ない' do
        @user.first_name = "umita"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters")
      end
      it 'ユーザー本名のlast_nameが空の場合は登録出来ない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名のlast_nameが全角文字で存在しない場合は登録出来ない' do
        @user.last_name = "kai"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters")
      end
      it 'ユーザー本名のfirst_name_kanaが空の場合は登録出来ない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のlast_name_kanaが空の場合は登録出来ない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名のfirst_name_kanaが全角(カタカナ)で存在しない場合は登録出来ない' do
        @user.first_name_kana = "ｳﾐﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
      end
      it 'ユーザー本名のlast_name_kanaが全角(カタカナ)で存在しない場合は登録出来ない' do
        @user.last_name_kana = "ｶｲ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
      end
      it 'birth_dateが空の場合は登録出来ない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
