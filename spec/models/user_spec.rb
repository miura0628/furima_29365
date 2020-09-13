require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録出来るとき' do
      it 'nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birth_dateが存在すれば登録出来る' do
        expect(@user).to be_valid
      end
      it 'emailは＠が存在すれば登録出来る' do
        @user.email = "furima29365@gmail.com"
      end
      it 'passwordは6文字以上で存在すれば登録出来る' do
      end
      it 'passwordは半角英数字混合で存在すれば登録出来る' do
      end
      it 'password, password_confirmation共に存在すれば登録出来る' do
      end
      it 'ユーザー本名のfirst_name, last_nameをが存在すれば登録出来る' do
      end
      it 'ユーザー本名のfirst_name_kana, last_name_kanaを全角(カタカナ)で存在すれば登録出来る' do
      end
    end

    context 'ユーザー新規登録出来ないとき' do
      it 'emailが重複している場合は登録出来ない' do
      end
      it 'emailは＠が存在しなければ登録出来ない' do
      end
      it 'passwordは6文字以上でなければ登録出来ない' do
      end
      it 'passwordは半角英数字混合でなければ登録出来ない' do
      end
      it 'passwordが存在しても、password_confirmationが空の場合は登録出来ない' do
      end
      it 'ユーザー本名のfirst_nameが空の場合は登録出来ない' do
      end
      it 'ユーザー本名のlast_nameが空の場合は登録出来ない' do
      end
      it 'ユーザー本名のfirst_name_kanaが空の場合は登録出来ない' do
      end
      it 'ユーザー本名のlast_name_kanaが空の場合は登録出来ない' do
      end
      it 'ユーザー本名のfirst_name_kanaが全角(カタカナ)で存在しない場合は登録出来ない' do
      end
      it 'ユーザー本名のlast_name_kanaが全角(カタカナ)で存在しない場合は登録出来ない' do
      end
      it 'birth_dateが空の場合は登録出来ない' do
      end
    end
  end
end
