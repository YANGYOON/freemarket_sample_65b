class UserProfile < ApplicationRecord
  belongs_to :user
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :phone_number, presence: true
end
