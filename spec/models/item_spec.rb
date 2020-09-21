require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品が出来るとき' do
      it 'imageが存在する場合は出品できる' do
        expect(@item).to be_valid
      end
      it 'item_nameが存在する場合は出品できる' do
        @item.item_name = "アイテム"
        expect(@item).to be_valid
      end
      it 'item_infoが存在する場合は出品できる' do
        @item.item_info = "これはアイテムの説明です"
        expect(@item).to be_valid
      end
      it 'item_categoryが---以外で存在する場合は出品できる' do
        @item.item_category_id = "3"
        expect(@item).to be_valid
      end
      it 'item_sales_statusが---以外で存在する場合は出品できる' do
        @item.item_category_id = "3"
        expect(@item).to be_valid
      end
      it 'item_shipping_fee_statusが---以外で存在する場合は出品できる' do
        @item.item_category_id = "3"
        expect(@item).to be_valid
      end
      it 'item_prefectureが---以外で存在する場合は出品できる' do
        @item.item_category_id = "3"
        expect(@item).to be_valid
      end
      it 'item_scheduled_deliveryが---以外で存在する場合は出品できる' do
        @item.item_category_id = "3"
        expect(@item).to be_valid
      end
      it 'item_priceが価格範囲内(¥300~¥9,999,999)で存在する場合は出品できる' do
        @item.item_price = "300"
        expect(@item).to be_valid
      end
    end
  end

  describe '商品出品' do
    context '商品出品が出来ないとき' do
      it 'imageが存在しない場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが存在しない場合は出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが存在しない場合は出品できない' do
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_categoryが---で存在する場合は出品できない' do
        @item.item_category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category Select")
      end
      it 'item_prefectureが---で存在する場合は出品できない' do
        @item.item_prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Select")
      end
      it 'item_sales_statusが---で存在する場合は出品できない' do
        @item.item_sales_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status Select")
      end
      it 'item_scheduled_deliveryが---で存在する場合は出品できない' do
        @item.item_scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery Select")
      end
      it 'item_shipping_fee_statusが---で存在する場合は出品できない' do
        @item.item_shipping_fee_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status Select")
      end
      it 'item_priceが存在しない場合は出品できない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが数字以外で存在する場合は出品できない' do
        @item.item_price = "abcdefg"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Input half-width number")
      end
      it 'item_priceが価格範囲外(299円以下)で存在する場合は出品できない' do
        @item.item_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Our of setting range")
      end
      it 'item_priceが価格範囲外(9,999,999円以上)で存在する場合は出品できない' do
        @item.item_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Our of setting range")
      end
    end
  end

end