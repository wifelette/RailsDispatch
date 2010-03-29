class Post < ActiveRecord::Base
  scope :published, where("published != ?", false)# .where("published_date <= ?", Time.now)

  scope :future, where("publish_date > ?", Time.now)
  scope :past, where("publish_date < ?", Time.now)# .where("published_date <= ?", Time.now)  

  scope :upcoming, published.where("publish_date > ?", Time.now).limit(1)

  scope :menu, where("published != ?", false).limit(4)

  belongs_to :user
  belongs_to :contributor

  validates_presence_of :title, :body, :contributor
end
