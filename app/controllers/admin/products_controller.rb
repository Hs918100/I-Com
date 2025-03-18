class Admin::ProductsController < ApplicationController
  
  def index
    authorize [:admin, :product] # Uses Admin::ProductPolicy
    @products = Product.all
  end
  
  def new
    @product = Product.new
    authorize [:admin, :product]
  end

  def create
    @product = Product.new(product_params)
    authorize [:admin, @product]
    
    if @product.save
      redirect_to admin_products_path, notice: "Product created successfully."
    else
      render :new
    end
  end
  
  def update
    @product = Product.find(params[:id])
    authorize [:admin, @product]
  
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    authorize [:admin, @product]
  
    @product.destroy
    redirect_to admin_products_path, notice: "Product deleted successfully."
  end

  private

  def product_params
    params.require(:product).permit(:name, :category, :price, :stock, :description)
  end


end
