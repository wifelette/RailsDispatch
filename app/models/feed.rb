class Feed < ActiveRecord::Base

  belongs_to :contributor
  has_many :feed_entries, :dependent => :destroy

  validates_presence_of :site_url, :feed_url

  after_save :update_feed_entries

  protected

  def update_feed_entries
    FeedEntry.update_from_feed(self.feed_url, self.id)
  end 

end
