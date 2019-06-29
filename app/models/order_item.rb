class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
end
