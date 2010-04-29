namespace :feed do
  desc "Update the feeds"
  task :update_all => :environment do    
    for feed in Feed.all do
      FeedEntry.update_from_feed(feed.feed_url, feed.id)
    end
  end
  
  desc "Remove duplicate entries"
  task :uniq => :environment do
    entries = FeedEntry.all.map{|e| {:id => e.id, :guid => e.guid}}
    duplicates = entries.select{|e| entries.select{|f| f[:guid] == e[:guid]}.size > 1}
    kept = []
    duplicates.each do |e|
      if kept.include? e[:guid]
        FeedEntry.find(e[:id]).destroy
      else
        kept << e[:guid]
      end
    end
  end
end