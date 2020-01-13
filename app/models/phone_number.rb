class PhoneNumber < ApplicationRecord
  belongs_to :user, optional: true

#REGEX and Validation
  PHONE_NUMBER_REGEX = /(070|080|090)-\d{4}-\d{4}/
  validates :phone_number, presence: true, uniqueness: { case_sensitive: false }, format: { with: PHONE_NUMBER_REGEX }
end
