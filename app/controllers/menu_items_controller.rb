class MenuItemsController < ApplicationController
  def create
    if current_user.admin?
      @menu_item = MenuItem.new(menu_items_params)
      if @menu_item.save
        redirect_to lunch_admin_index_path, notice: 'Your menu item successful created'
      else
        redirect_to lunch_admin_index_path, alert: 'Your menu item not created'
      end
    else
      redirect_to root_path, alert: 'Your menu item not created'
    end
  end

  private

  def menu_items_params
    params.require(:menu_item).permit(:name, :price, :kind, :image_url)
  end
end
