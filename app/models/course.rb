class Course < ApplicationRecord
  validates :name, :price, :kind, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  enum kind: %i[main_dish soup drink]

  def as_json
    {
      id: id,
      price: price,
      type: kind,
      name: name
    }
  end

  def self.check_soup(soup_id)
    if soup_id
      Course.find(soup_id).kind == 'soup'
    else
      true
    end
  end

  def self.check_drink(drink_id)
    if drink_id
      Course.find(drink_id).kind == 'drink'
    else
      true
    end
  end

  def self.check_main_dish(main_dish_id)
    if main_dish_id
      Course.find(main_dish_id).kind == 'main_dish'
    else
      true
    end
  end
end
