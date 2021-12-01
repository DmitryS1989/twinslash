# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :set_user!, only: %i[edit update destroy]
    before_action :user_admin?

    def index
      respond_to do |format|
        format.html do
          @users = User.order(created_at: :desc)
        end
      end
    end

    def edit
      @user
    end

    def update
      if @user.update user_params
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = t '.success'
      redirect_to admin_users_path
    end

    private

    def set_user!
      @user = User.find params[:id]
    end

    def user_admin?
      unless current_user.admin_role?
        flash[:error] = 'You must be logged in to access this section'
        redirect_to home_url # прерывает цикл запроса
      end
    end

    def user_params
      params.require(:user).permit(
        :email, :name, :role
      )
    end
  end
end
