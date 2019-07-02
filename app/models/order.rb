class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
  scope :user_and_date, lambda { |user, date|
    Order.where(user: user).includes(:menu_item).where("menu_items.date": date)
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
      return false unless Order.create(user: user, menu_item: MenuItem.find(val))
    end
    true
  end
end
