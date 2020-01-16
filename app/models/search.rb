class Search < ApplicationRecord
  belongs_to :category
  belongs_to :brand, optional: true
end
