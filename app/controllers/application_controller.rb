class ApplicationController < ActionController::API
  include ExceptionHandler
  include Pundit::Authorization


  before_action :authorize_request
  attr_reader :current_user

  def authorize_request
    @current_user = (AuthorizedApiRequest.new(request.headers).call)[:user]
  end
end
