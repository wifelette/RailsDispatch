class Notification < ActiveRecord::Base
  def self.current_notifications
    find(:all, :conditions => "starts_at <= now() AND ends_at >= now()")
  end
end