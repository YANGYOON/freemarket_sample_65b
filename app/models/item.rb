class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  has_one :shipping, dependent: :destroy, validate: true
  accepts_nested_attributes_for :shipping, allow_destroy: true

  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  validates :name, presence: true
  validates :state, presence: true
  validates :condition, presence: true
  validates :root_category_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true,
                    numericality: {
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9999999}

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end