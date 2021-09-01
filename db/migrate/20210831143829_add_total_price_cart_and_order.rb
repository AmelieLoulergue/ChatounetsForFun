class AddTotalPriceCartAndOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total_amount, :integer
    add_column :orders, :total_amount, :integer
  end
end
