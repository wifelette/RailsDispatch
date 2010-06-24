class Notification < ActiveRecord::Base
  scope :current_notifications, lambda { where("starts_at <= ?", Time.now). where("ends_at >= ?", Time.now).limit(1) }
end




