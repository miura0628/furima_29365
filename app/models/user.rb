class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :birth_date
    validates :nickname
    validates :first_name,             format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "Input full-width characters."}
    validates :last_name,              format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "Input full-width characters."}
    validates :first_name_kana,        format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters."}
    validates :Last_name_kana,         format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters."}
  end
end