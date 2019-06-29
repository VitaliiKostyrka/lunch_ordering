class MenuItem < ApplicationRecord
  has_many :order_items
  belongs_to :course
  validates :date, presence: true
end
