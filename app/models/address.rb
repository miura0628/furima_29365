class Address < ApplicationRecord
  belongs_to :order

    validates :postal_code,          format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}

  with_option presence: true do
    validates :postal_code
    validates :prefecture_id,  numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :address
    validates :phone_number          format: { with: /\A\d{,11}\z/, message: ""}
  end
end
