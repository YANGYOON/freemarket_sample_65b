class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, presence: true
  validates :nickname, uniqueness: true
  has_one :address, dependent: :destroy
  has_one :phone_number, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phone_number
  
end
