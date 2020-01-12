class Address < ApplicationRecord
  belongs_to :user, optional: true

#REGEX and Validation
  validates :zipcode,         presence: true
  validates :prefecture,      presence: true
  validates :city,            presence: true, length: {maximum: 50}
  validates :detail_address,  presence: true, length: {maximum: 100}
end
