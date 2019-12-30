class Shipping < ApplicationRecord
  belongs_to :item

  validates :method, presence: true
  validates :prefecture_from, presence: true
  validates :period_before_shipping, presence: true
  validates :fee_burden, presence: true
end
