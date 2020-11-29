class ApplicationController < ActionController::Base
  before_action :furima_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def furima_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['FURIMA_AUTH_USER'] && password == ENV['FURIMA_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end
