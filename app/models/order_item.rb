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

  def self.check_kind_of_order_item(params)
    check_drink(params[:drink]) && check_main_dish(params[:main]) && check_soup(params[:soup])
  end

  def self.check_soup(soup_id)
    if soup_id
      MenuItem.find(soup_id).course.kind == 'soup'
    else
      true
    end
  end

  def self.check_drink(drink_id)
    if drink_id
      MenuItem.find(drink_id).course.kind == 'drink'
    else
      true
    end
  end

  def self.check_main_dish(main_dish_id)
    if main_dish_id
      MenuItem.find(main_dish_id).course.kind == 'main_dish'
    else
      true
    end
  end
end
