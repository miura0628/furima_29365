class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :item_category

  with_options presence: true do
  validates :item_image
  validates :item_name
  validates :item_info
  validates :item_categoty
  validates :item_sales_status
  validates :item_shipping_fee_status
  validates :item_prefecture
  validates :item_scheduled_delivery
  validates :item_price
  validates :user, numericality: { other_than: 1}
  end
end
