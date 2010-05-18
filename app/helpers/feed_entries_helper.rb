module FeedEntriesHelper
  def byline(entry)
    unless entry.author.blank?
      "by #{entry.author}"
    end
  end
end
