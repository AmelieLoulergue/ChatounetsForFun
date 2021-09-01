class CorrectTypos < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_admin?
    add_column :users, :is_admin?, :boolean
  end
end
