class AuthenticationController < ApplicationController
  skip_before_action :authorize_request
  def authenticate
    auth_token = AuthenticationUser.new(params[:email], params[:password]).call
    render json: { token: auth_token }
  end
end
