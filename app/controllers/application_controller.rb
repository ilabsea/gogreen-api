class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_request_header
  def set_request_header
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
