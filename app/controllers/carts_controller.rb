class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  
  def show
    if current_user
      @cart_items = current_user.cart&.cart_items
    else
      session[:cart] ||= []
      @cart_items = session[:cart].map do |item|
        product = Product.find(item["product_id"])
        { product: product, quantity: item["quantity"] }
      end
    end
  end

end