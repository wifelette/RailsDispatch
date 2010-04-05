class FeedEntry < ActiveRecord::Base
  
  belongs_to :feed
  
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
      unless exists? :guid => entry.id
        create!(
          :title          => entry.title,
          :summary        => entry.summary,
          :url            => entry.url,
          :published_at   => entry.published,
          :author         => entry.author,
          :guid           => entry.id,
          :feed_id        => feed_id
        )
      end
    end    
  end
end


