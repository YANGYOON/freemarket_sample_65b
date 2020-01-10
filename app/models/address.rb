class Address < ApplicationRecord
  belongs_to :user, optional: true

#REGEX and Validation
  ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/i
  validates :zipcode,         presence: true,                        format: { with: ZIPCODE_REGEX }
  validates :prefecture,      presence: true
  validates :city,            presence: true, length: {maximum: 50}
  validates :detail_address,  presence: true, length: {maximum: 100}
  validates :building
  validates :optional_phone_number
end
