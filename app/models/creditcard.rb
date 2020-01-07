class Creditcard < ApplicationRecord
  validates :user_id, :customer_id, :card_id, presence: true
  belongs_to :user
end
