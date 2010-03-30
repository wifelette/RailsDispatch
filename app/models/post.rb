class Post < ActiveRecord::Base
  scope :published, where("published != ?", false)# .where("published_date <= ?", Time.now)

  scope :future, where("publish_date > ?", Time.now)
  scope :past, where("publish_date < ?", Time.now)# .where("published_date <= ?", Time.now)  

  scope :upcoming, published.where("publish_date > ?", Time.now).limit(1)

  scope :menu, where("published != ?", false).limit(4)

  belongs_to :user
  belongs_to :contributor

  validates_presence_of :title, :body, :contributor
    
  def days_until
    (self.publish_date.to_datetime - Date.today.to_datetime).to_i.to_s
  end
  
end
