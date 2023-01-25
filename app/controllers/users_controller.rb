class UsersController < ApplicationController

  skip_before_action :authorize_request, only: %i[create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity #422
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
