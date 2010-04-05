class Post < ActiveRecord::Base

  scope :published, where("published != ?", false)# .where("published_date <= ?", Time.now)
  scope :future, where("publish_date > ?", Time.now)
  scope :past, where("publish_date < ?", Time.now)# .where("published_date <= ?", Time.now)  
  scope :upcoming, published.where("publish_date > ?", Time.now).limit(1)
  scope :menu, where("published != ?", false).limit(4)

  validates_presence_of :title, :sidebar_title, :contributor, :body, :publish_date, :slug

  belongs_to :user
  belongs_to :contributor
  has_many :elements, :dependent => :destroy
  accepts_nested_attributes_for :elements, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true

  before_validation :write_slug

  def days_until
    (self.publish_date.to_datetime - Date.today.to_datetime).to_i.to_s
  end  

  def write_slug
    self.slug = self.title if self.slug.blank?
  end

  def slug=(text)
    write_attribute(:slug, text.parameterize)
  end

end
