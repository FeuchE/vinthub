class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.string :category
      t.string :size
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
