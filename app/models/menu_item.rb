class MenuItem < ApplicationRecord
  has_many :orders
  validates :name, :price, :kind, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  scope :kind_and_date, ->(kind, date) { MenuItem.where(date: date).where(kind: kind) }
  enum kind: %i[main_dish soup drink]

  def menu_item_to_hash
    {
      id: id,
      name: name,
      price: price,
      type: kind,
      image_url: image_url
    }
  end

  def self.check_soup(soup_id)
    return MenuItem.find(soup_id).soup? if soup_id

    true
  end

  def self.check_drink(drink_id)
    return MenuItem.find(drink_id).drink? if drink_id

    true
  end

  def self.check_main_dish(main_dish_id)
    return MenuItem.find(main_dish_id).main_dish? if main_dish_id

    true
  end

  def self.menu_data_to_dashboard(date)
    {
      soups: soups(date),
      main_dishes: main_dishes(date),
      drinks: drinks(date)
    }
  end

  def self.main_dishes(date)
    MenuItem.kind_and_date('main_dish', date).map(&:menu_item_to_hash)
  end

  def self.soups(date)
    MenuItem.kind_and_date('soup', date).map(&:menu_item_to_hash)
  end

  def self.drinks(date)
    MenuItem.kind_and_date('drink', date).map(&:menu_item_to_hash)
  end

  def self.check_kind_of_order_item(params)
    check_drink(params[:drink]) && check_main_dish(params[:main_dish]) && check_soup(params[:soup])
  end
end
