class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
  scope :user_and_date, lambda { |user, date|
    Order.where(user: user).includes(:menu_item).where("menu_items.date": date)
  }
  scope :users_id_which_make_order_at_date, lambda { |date|
    Order.includes(:menu_item).where("menu_items.date": date).pluck(:user_id).uniq
  }

  def self.order_data_to_dashboard(user, date)
    courses = menu_item_list(Order.user_and_date(user, date))
    {
      items: courses,
      total_price: total_price_order(courses)
    }
  end

  def self.total_price_order(courses)
    courses.map { |h| h[:price] }.sum
  end

  def self.menu_item_list(orders)
    orders.map { |order| order.menu_item.menu_item_to_hash }
  end

  def self.create_order(params, user)
    params.each do |_, val|
      @order = Order.new(user: user, menu_item: MenuItem.find(val))
      return false unless @order.save
    end
    true
  end

  def self.all_orders_for_date(date)
    users_id_which_make_order_at_date(date).map { |uid| Order.make_hash_order_for_user(User.find(uid), date) }
  end

  def self.make_hash_order_for_user(user, date)
    { user.name => Order.order_data_to_dashboard(user, date) }
  end
end
