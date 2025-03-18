require 'pry'
class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:show, :edit, :update] 
    before_action :authorize_user
    before_action :verify_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all
    end

    def show
        
    end

    def edit
    
    end

    def update
        if @user.update(user_params)
          redirect_to admin_users_path, notice: "User updated successfully."
        else
          render :edit
        end
    end

    def destroy
        binding.pry
        if @user.destroy
            redirect_to admin_users_path, notice: "User deleted successfully."
        end
    end

    private

    def verify_user
        @user = find_user
        if @user.admin?
            redirect_to admin_users_path, alert: "You are Not authorised to edit/delete Admins"
        end
    end

    def authorize_user
        authorize [:admin, :user] # Uses Admin::UserPolicy
    end

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :role)
    end
  end
  