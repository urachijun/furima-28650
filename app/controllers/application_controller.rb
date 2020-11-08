class ApplicationController < ActionController::Base
  before_action :furima_auth

  
  private

  def furima_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["FURIMA_AUTH_USER"] && password == ENV["FURIMA_AUTH_PASSWORD"]
    end
  end
end
