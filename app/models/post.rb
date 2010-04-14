class Post < ActiveRecord::Base

  scope :published, where("published != ?", false)
  scope :menu, where("published != ?", false).limit(4)
  scope :desc, order("publish_date desc")
  scope :asc, order("publish_date asc")

  validates_presence_of :title, :sidebar_title, :contributor, :body, :publish_date, :slug

  belongs_to :user
  belongs_to :contributor
  has_many :elements, :dependent => :destroy
  accepts_nested_attributes_for :elements, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true

  before_validation :write_slug

  def self.future
    where("publish_date > ?", Time.now)
  end

  def self.past
    where("publish_date < ?", Time.now).desc
  end

  def self.recent
    past.published.desc.limit(4)
  end

  def self.upcoming
    published.where("publish_date > ?", Time.now).asc.limit(1)
  end

  def self.slugged(name)
    past.published.where(:slug => name)
  end

  def self.next
    future.published.asc.limit(1).first
  end

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
