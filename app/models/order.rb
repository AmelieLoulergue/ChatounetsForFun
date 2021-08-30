class Order < ApplicationRecord
  has_many :order_items, foreign_key: 'order_id', dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user
end
