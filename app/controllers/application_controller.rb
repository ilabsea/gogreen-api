class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_request_header
  def set_request_header
    headers['Access-Control-Allow-Origin'] = '*'
    # headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    # headers['Access-Control-Request-Method'] = '*'
    # headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

    # headers['Access-Control-Allow-Origin'] = '*'
    # headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    # headers['Access-Control-Allow-Headers'] = '*'
    # headers['Access-Control-Max-Age'] = "1728000"
  end
end
