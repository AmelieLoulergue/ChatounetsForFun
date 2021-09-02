class Category < ApplicationRecord
  has_many :items, foreign_key: "category_id"
end
