class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_request_header
  helper_method :current_user

  def set_request_header
    headers['Access-Control-Allow-Origin'] = '*'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
