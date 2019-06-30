class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :order_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def dashboard_data_for_this_date(datestr)
    date = Date.parse(datestr)
    {
      date: date,
      order_info: OrderItem.order_data(self, date)
    }
  end
end
