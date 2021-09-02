class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    change_table :items do |t|
      t.belongs_to :category, foreign_key: true, index: true
    end

  end
end
