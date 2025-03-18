class ProductsController < ApplicationController
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end