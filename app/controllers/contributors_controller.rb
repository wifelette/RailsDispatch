class ContributorsController < ApplicationController
  respond_to :html, :rss
  
  def index
    @contributors = Contributor.visible
    respond_with @contributors
  end
  
  def show
    @contributor = Contributor.find(params[:id])
    
    @feed = Feed.where(:contributor_id => params[:id])
    @entries = FeedEntry.where(:feed_id => @feed.id)
    respond_with @contributor
  end

  def apply
  end
  
end

