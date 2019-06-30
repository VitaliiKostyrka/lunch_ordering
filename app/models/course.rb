class Course < ApplicationRecord
  validates :name, :price, :kind, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  enum kind: %i[main_dish soup drink]
end
