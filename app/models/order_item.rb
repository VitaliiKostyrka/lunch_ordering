class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
  scope :user_and_date, lambda { |user, date|
    OrderItem.where(user: user).includes(:menu_item).where("menu_items.date": date)
  }

  def self.order_data(user, date)
    courses = course_list(OrderItem.user_and_date(user, date))
    {
      items: courses,
      total_price: total_price_order_from_course_list(courses)
    }
  end

  def self.total_price_order_from_course_list(courses)
    courses.map { |h| h[:price] }.sum
  end

  def self.course_list(orders)
    list = []
    orders.each do |order|
      list.append(name: order.menu_item.course.name,
                  price: order.menu_item.course.price,
                  type: order.menu_item.course.kind)
    end
    list
  end

  def self.create_order(params, user)
    date = params[:date]
    params.delete(:date)
    params.each do |_, val|
      return false unless OrderItem.create(user: user, menu_item: MenuItem.course_and_date(val.to_i, Date.parse(date)))
    end
    true
  end
end
