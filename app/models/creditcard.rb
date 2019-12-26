class Creditcard < ApplicationRecord
  validates :security_token, :user_id true
  belongs_to :item
end
