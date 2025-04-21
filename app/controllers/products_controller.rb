class ProductsController < ApplicationController
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @products = Product.search_by_keyword(params[:query]).records
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end