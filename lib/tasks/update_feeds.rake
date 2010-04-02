namespace :feed do
  desc "Update the feeds"
  task :update_all => :environment do    
    for feed in Feed.all do
     FeedEntry.update_from_feed(feed.feed_url, feed.id)
    end
  end
end