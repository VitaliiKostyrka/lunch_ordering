class MenuItem < ApplicationRecord
  has_many :order_items
  belongs_to :course
  validates :date, presence: true
  scope :drink_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'drink') }
  scope :soup_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'soup') }
  scope :main_dish_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'main_dish') }
  scope :course_and_date, ->(course_id, date) { MenuItem.where(date: date).where(course: Course.find(course_id)).first }

  def self.menu_data(date)
    {
      soups: soups(date),
      main_dishes: main_dishes(date),
      drinks: drinks(date)
    }
  end

  def self.main_dishes(date)
    MenuItem.main_dish_at_date(date).map { |h| h.course.as_json }
  end

  def self.soups(date)
    MenuItem.soup_at_date(date).map { |h| h.course.as_json }
  end

  def self.drinks(date)
    MenuItem.drink_at_date(date).map { |h| h.course.as_json }
  end

  def self.check_kind_of_order_item(params)
    Course.check_drink(params[:drink]) && Course.check_main_dish(params[:main]) && Course.check_soup(params[:soup])
  end
end
