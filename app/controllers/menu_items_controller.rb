class MenuItemsController < ApplicationController
  def create
    if MenuItem.create(menu_items_params)
      redirect_to lunch_admin_index_path, notice: "Menu item saved"
    else
      redirect_to lunch_admin_index_path, alert: "Menu item not saved"
    end
  end

  private

  def menu_items_params
    params.require(:menu_item).permit(:name, :price, :kind)
  end
end
