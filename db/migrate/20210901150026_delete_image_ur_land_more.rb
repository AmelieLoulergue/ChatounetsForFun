class DeleteImageUrLandMore < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image_url
    add_column :users, :s_admin?, :boolean
  end
end
