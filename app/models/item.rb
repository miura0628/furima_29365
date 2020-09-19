class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :item_image
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery
  belongs_to :user

  with_options presence: true do
  validates :item_image
  validates :item_name
  validates :item_info
  validates :item_price,                         format: { with: /\A[0-9]+\z/, message: "Input harf-width number"}
  end

  validates :item_price,                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Our of setting range"}

  with_options presence: true do
  validates :item_category_id,             numericality: { other_than: 1, message: "Select"}
  validates :item_sales_status_id,         numericality: { other_than: 1, message: "Select"}
  validates :item_shipping_fee_status_id,  numericality: { other_than: 1, message: "Select"}
  validates :item_prefecture_id,           numericality: { other_than: 1, message: "Select"}
  validates :item_scheduled_delivery_id,   numericality: { other_than: 1, message: "Select"}
  end
end
