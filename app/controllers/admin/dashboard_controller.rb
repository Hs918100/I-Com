class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
     # Uses Admin::DashboardPolicy
    authorize [:admin, :dashboard]
    @users = User.all
    @products = Product.all
  end

end