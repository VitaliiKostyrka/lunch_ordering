class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :menu_item
      t.belongs_to :user
      t.timestamps
    end
  end
end
