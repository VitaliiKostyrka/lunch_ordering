class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  before_save :check_to_make_admin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :email, :encrypted_password, presence: true

  def dashboard_data_for_this_date(datestr)
    date = Date.parse(datestr)
    {
      date: date,
      order_info: Order.order_data_to_dashboard(self, date),
      menu_info: MenuItem.menu_data_to_dashboard(date)
    }
  end

  def user_to_hash
    { email: email, name: name }
  end

  def self.admin_dashboard_data(date)
    {
      users: User.all.map(&:user_to_hash),
      orders: Order.all_orders_for_date(date)
    }
  end

  def check_to_make_admin
    # Only the first user should be made admin
    self.admin = true if User.count.zero?
  end
end
