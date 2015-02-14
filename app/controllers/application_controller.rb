class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :store_location

  def store_location
  	session[:user_return_to] = request.fullpath unless (request.fullpath =~ /\/users/ || request.fullpath =~ /\/bookings/)
  end

  def after_sign_in_path_for(resource)
  	session[:user_return_to] || root_path
  end
end