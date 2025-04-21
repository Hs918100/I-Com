require 'pry'
class ApplicationController < ActionController::Base
    include Pundit
    before_action :set_sentry_context
    before_action :authenticate_user!
    after_action :verify_authorized, except: :index, unless: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_action :migrate_cart_to_user, if: :user_signed_in?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def after_sign_out_path_for(resource_or_scope)
      flash[:notice] = "You have logged out successfully."
      root_path # or any other path you'd like
    end

    def set_sentry_context
      Sentry.set_user(id: current_user.id, email: current_user.email) if current_user
    end
    
    def migrate_cart_to_user
      # Check if the user has a session-based cart
      return unless session[:cart].present?
  
      # Migrate items from the session cart to the user's permanent cart
      session[:cart].each do |item|
        # Assuming you have a Cart model and the user has many cart_items
        # Create cart items for the user
        current_user.cart.cart_items.create(product_id: item["product_id"], quantity: item["quantity"])
      end
  
      # After migration, clear the session cart to prevent duplicates
      session[:cart] = nil
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end
end

