class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname              format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :email                 format: { with: /@.+/, message: "is invalid. Include @ mark."}
    validates :password              format: { with: /[a-z\d]{6,}/, message: "is invalid. Input harf-width characters."}
    validates :password_confirmation format: { with: /[a-z\d]{6,}/, message: "is invalid. Input harf-width characters."}
    validates :frist_name            format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name             format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :frist_name_kana       format: { with: /\A[ァ-ヶーー]\z/ message: "is invalid. Input full-width characters."}
    validates :last_name_kana        format: { with: /\A[ァ-ヶーー]\z/ message: "is invalid. Input full-width characters."}
  end
end