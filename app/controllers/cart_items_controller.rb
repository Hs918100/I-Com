class CartItemsController < ApplicationController
  before_action :set_cart
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    if current_user
      cart_item = @cart.cart_items.find_or_initialize_by(product: product)
      if cart_item.quantity.nil?
        cart_item.quantity = 1
      else
        cart_item.quantity += 1
      end
      if cart_item.save
        redirect_to cart_path, notice: "Added to cart!"
      else
        redirect_to products_path, alert: "Could not add item."
      end
      
    else
      session[:cart] = [] unless session[:cart].is_a?(Array)  # Initialize cart if it's not already in the session
    
      # Find or initialize the cart item
      cart_item = session[:cart].find { |item| item["product_id"] == product.id }
      
      if cart_item
        # If the item is already in the cart, increase the quantity
        cart_item["quantity"] += 1
      else
        # Otherwise, add a new cart item to the session cart
        session[:cart] << { "product_id" => product.id, "quantity" => 1 }
      end
      
      redirect_to cart_path, notice: "Added to cart!"
    end
  end

  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_path, notice: "Cart updated."
    else
      redirect_to cart_path, alert: "Update failed."
    end
  end

  def destroy
    if current_user
      cart_item = @cart.cart_items.find(params[:id])
      cart_item.destroy
    else
      session[:cart].delete_if { |item| item["product_id"] == params[:id].to_i }
    end
    redirect_to cart_path, notice: "Item removed."
  end

  private

  def set_cart
    if current_user
      @cart = current_user.cart || current_user.create_cart
    else
      session[:cart] ||= Cart.new
      @cart = session[:cart]
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
