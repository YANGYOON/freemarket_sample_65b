class Size < ApplicationRecord
  has_many :categorys, through: :category_sizes
  has_many :category_sizes
end
