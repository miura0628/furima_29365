class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  end
  validates :prefecture_id,  numericality: { other_than: 1, message: "Select" }

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number,         format: { with: /\A\d{,11}\z/, message: "Input correctly"}
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)  
    Address.create!(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end