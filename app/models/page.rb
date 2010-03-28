class Page < ActiveRecord::Base
  scope :published, where("published != ?", false)
  
  
end