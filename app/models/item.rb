class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 } #, :message => "doit contenir 2 chiffres après le point"
  validates :image_url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix }

end
