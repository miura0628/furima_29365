require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入の条件' do
    before do
       @order_address = FactoryBot.build(:order_address)
    end

    describe '商品購入' do
      context '商品購入出来るとき' do
        it '入力フォームを全て正しく入力されている場合(building_nameは任意)は購入出来る' do
          expect(@order_address).to be_valid
        end
        it 'postal_codeが123-4567のようにハイフン(-)を含めた半角数字が存在する場合は購入出来る' do
          @order_address.postal_code = "990-9999"
          expect(@order_address).to be_valid
        end
        it 'prefectureが---以外で存在する場合は購入出来る' do
          @order_address.prefecture_id = "3"
          expect(@order_address).to be_valid
        end
        it 'cityが存在する場合は購入出来る' do
          @order_address.city = "山形市"
          expect(@order_address).to be_valid
        end
        it 'addressが存在する場合は購入出来る' do
          @order_address.address = "渋谷109"
          expect(@order_address).to be_valid
        end
        it 'phone_numberが11桁以内の半角数字だけで存在する場合は購入出来る' do
          @order_address.phone_number = "12301570157"
          expect(@order_address).to be_valid
        end
      end
    end

    describe '商品購入' do
      context '商品購入出来ないとき' do
        it 'クレジットカード情報入力欄のカード情報が空欄で存在する場合は購入出来ない' do
          @order_address.token = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空欄で存在する場合は購入出来ない' do
          @order_address.postal_code = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが1234567のようにハイフン(-)を含まない場合は購入出来ない' do
          @order_address.postal_code = "1234567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'postal_codeが123-a567のようにハイフン(-)を含めているが、半角数字以外が存在する場合は購入出来ない' do
          @order_address.postal_code = "123-a567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'postal_codeのハイフン(-)の位置が正しくない(例: 12-34567)場合は購入出来ない' do
          @order_address.postal_code = "12-34567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'prefectureが---で存在する場合は購入出来ない' do
          @order_address.prefecture_id = "---"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture Select")
        end
        it 'cityが存在しない場合は購入出来ない' do
          @order_address.city = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが存在しない場合は購入出来ない' do
          @order_address.address = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが存在しない場合は購入出来ない' do
          @order_address.phone_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁以上の半角数字で存在する場合は購入出来ない' do
          @order_address.phone_number = "080123456789"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'phone_numberに半角数字以外(例: 090a123456)が存在する場合は購入出来ない' do
          @order_address.phone_number = "080a3456789"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
        end
      end
    end

  end
end
