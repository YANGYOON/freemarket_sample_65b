class Creditcard < ApplicationRecord
  # validates :customer_id, :card_id, :user_id true
  belongs_to :user
end
