class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.date :date
      t.belongs_to :course
      t.timestamps
    end
  end
end
