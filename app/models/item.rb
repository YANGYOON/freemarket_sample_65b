class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_one :shipping, dependent: :destroy
  accepts_nested_attributes_for :shipping, allow_destroy: true
  belongs_to :category
  # belongs_to :brand, optional: true

  # belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User", optional: true
end
