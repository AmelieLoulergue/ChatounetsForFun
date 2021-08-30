class Cart < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true, presence: true
  has_many :cart_items, foreign_key: "cart_id", dependent: :destroy 
  has_many :items, through: :cart_items
end
