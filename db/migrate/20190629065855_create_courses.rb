class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.integer :kind
      t.string :image_url

      t.timestamps
    end
  end
end
