class ApplicationController < ActionController::Base
 # before_action :basic_auth
 # before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

private
  def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def move_to_index
    unless user_signed_in?
      #redirect_to 
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :Last_name_kana, :birth_date])
  end
end

