class MenuItemsController < ApplicationController
  def create
    @menu_item = MenuItem.new(menu_items_params)
    if @menu_item.save
      redirect_to request.referrer, notice: 'Your menu item successful created'
    else
      redirect_to request.referrer, alert: 'Your menu item not created'
    end
  end

  private

  def menu_items_params
    params.require(:menu_item).permit(:name, :price, :kind)
  end
end
