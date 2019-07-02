class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.date :date
      t.decimal :price, precision: 5, scale: 2
      t.integer :kind
      t.string :image_url
      t.timestamps
    end
  end
end
