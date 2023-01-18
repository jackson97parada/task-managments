class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    binding.break
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity #422
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end