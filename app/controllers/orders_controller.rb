class OrdersController < ApplicationController
  def create
    if MenuItem.check_kind_of_order_item(order_params) && Order.create_order(order_params, current_user)
      redirect_to request.referrer, notice: 'Your order successful created'
    else
      redirect_to root_path, alert: 'Your order not created'
    end
  end

  protected

  def order_params
    params.require(:order).permit(:soup, :drink, :main, :date)
  end
end
