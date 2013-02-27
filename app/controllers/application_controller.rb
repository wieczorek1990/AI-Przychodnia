class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  end
end
