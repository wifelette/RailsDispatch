class FeedEntry < ActiveRecord::Base
  
  belongs_to :feed

  scope :by_date, order("published_at desc")
  scope :recent, limit(10).by_date
  scope :paginated, lambda { |page| recent.offset(page.to_i * 10) }
  
  def self.update_from_feed(feed_url, feed_id)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries, feed_id)
  end

  # def self.update_from_feed_continuously(feed_url, delay_interval = 1.minutes)
  #   feed = Feedzirra::Feed.fetch_and_parse(feed_url)
  #   add_entries(feed.entries)
  #   loop do
  #     sleep delay_interval
  #     feed = Feedzirra::Feed.update(feed)
  #     add_entries(feed.new_entries)
  #   end
  # end

  private

  def self.add_entries(entries, feed_id)
    entries.each do |entry|
      e = {
        :title          => entry.title,
        :summary        => entry.summary,
        :url            => entry.url,
        :published_at   => entry.published,
        :author         => entry.author,
        :guid           => entry.id,
        :feed_id        => feed_id
      }
      FeedEntry.find_or_create_by_guid(e)
    end    
  end
end


