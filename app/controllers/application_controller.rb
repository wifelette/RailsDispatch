class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  @notifications = Notification.current_notifications
  
  
  # @notifications = Notification.current_notifications
  
end
