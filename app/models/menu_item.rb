class MenuItem < ApplicationRecord
  has_many :order_items
  belongs_to :course
  validates :date, presence: true
  scope :drink_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'drink') }
  scope :soup_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'soup') }
  scope :main_dish_at_date, ->(date) { MenuItem.where(date: date).includes(:course).where("courses.kind": 'main_dish') }

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
end
