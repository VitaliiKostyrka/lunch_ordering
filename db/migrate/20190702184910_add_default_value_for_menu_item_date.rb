class AddDefaultValueForMenuItemDate < ActiveRecord::Migration[5.2]
  def change
    change_column_default :menu_items, :date, Date.today
  end
end
