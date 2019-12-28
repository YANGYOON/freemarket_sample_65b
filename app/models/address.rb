class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zipcode, :prefecture, :city, :detail_address, presence: true
end
