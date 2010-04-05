# atom_feed do |feed|
#   feed.title("Rails Dispatch")
#   feed.updated(@posts.first.publish_date)
#   
#   @posts.each do |post|
#     feed.entry(post) do |entry|
#       entry.title(post.title)
#       entry.content(post.body, :type => 'html')
#       entry.content(post.contributor.full_name if post.contributor)
#     end 
#   end
# end


xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Rails Dispatch"
    xml.description "Rails news delivered fresh"
    xml.link post_url

    for post in @body_posts
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post.slug)
      end
    end
  end
end