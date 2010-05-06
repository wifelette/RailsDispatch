class Post < ActiveRecord::Base

  scope :published, where("published != ?", false)
  scope :menu, where("published != ?", false).limit(4)
  scope :descending, order("publish_date desc")
  scope :ascending, order("publish_date asc")
  scope :future, lambda { where('publish_date > ?', Time.now)}
  scope :past, lambda { where('publish_date <= ?', Time.now).descending}
  scope :recent, past.published.descending.limit(4)
  scope :upcoming, published.future.ascending.limit(1)
  scope :slugged, lambda {|name| past.published.where(:slug => name)}

  validates_presence_of :title, :sidebar_title, :contributor, :body, :publish_date, :slug

  belongs_to :user
  belongs_to :contributor
  has_many :elements, :dependent => :destroy
  accepts_nested_attributes_for :elements, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true

  before_validation :write_slug

  def self.next
    upcoming.first
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
