class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart, foreign_key: true, index: true
      t.belongs_to :item, foreign_key: true, index: true
      t.timestamps
    end
  end
end
