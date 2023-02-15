module Api
  module V1
    class UsersController < ApplicationController

      skip_before_action :authorize_request, only: %i[create]

      def create
        @user = User.new(user_params)
        if @user.save
          UserWelcomeMailer.with(user: @user).welcome.deliver_later
          render json: { message: 'User created successfully' }, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity #422
        end
      end

      private

      def user_params
        params.permit(:email, :password, enterprise_attributes: %i[nit address mobile])
      end
    end

  end
end
