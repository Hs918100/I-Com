class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = current_user.orders.order(created_at: :desc)
    authorize @orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    authorize @order
    @cart = current_user.cart
    redirect_to cart_path, alert: "Your cart is empty." if @cart.cart_items.empty?
  end

  def create
    @cart = current_user.cart
    @order = current_user.orders.build(total_price: @cart.cart_items.sum { |item| item.quantity * item.product.price }, status: "pending")
    authorize @order

    @cart.cart_items.each do |cart_item|
      @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
    end

    if @order.save
      @cart.cart_items.destroy_all  # Empty the cart after order is placed
      redirect_to @order, notice: "Order placed successfully!"
    else
      redirect_to cart_path, alert: "Something went wrong."
    end
  end


end
