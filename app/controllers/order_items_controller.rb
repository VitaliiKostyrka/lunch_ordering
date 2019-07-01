class OrderItemsController < ApplicationController
  def create
    if OrderItem.check_kind_of_order_item(order_params)
      order_params.each do |_, val|
        unless OrderItem.create(user: current_user, menu_item_id: val.to_i)
          redirect_to root_path, alert: 'Your order not created'
        end
      end
      redirect_to root_path, notice: 'Your order successful created'
    else
      redirect_to root_path, alert: 'Your order not created'
    end
  end

  protected

  def order_params
    params.require(:order).permit(:soup, :drink, :main)
  end
end
