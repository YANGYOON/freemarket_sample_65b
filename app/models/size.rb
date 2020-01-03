class Size < ApplicationRecord
  belongs_to :category, optional: true
  has_many :items
end