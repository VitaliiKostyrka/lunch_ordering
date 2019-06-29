class Course < ApplicationRecord
  validates :name, :price, :kind, presence: true
  enum kind: %i[main_dish soup drink]
end
