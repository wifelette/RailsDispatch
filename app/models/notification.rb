class Notification < ActiveRecord::Base
  scope :current_notifications, where("starts_at <= ?", Time.now).where("ends_at >= ?", Time.now).limit(1)
end
