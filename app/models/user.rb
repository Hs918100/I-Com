class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_admin_field

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { customer: 'customer', vendor: 'vendor', admin: 'admin' }
  has_one :cart
  has_many :orders

  def admin?
    admin
  end

  def customer?
    role == "customer"
  end
  
  private

  def set_admin_field
    # Set the admin field to true if the role is 'admin', otherwise false
    self.admin = role == 'admin'
  end
end
