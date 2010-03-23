class CommunityController < ApplicationController
  def index
    @feeds = Feed.all
    @feed_entries = FeedEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feed_entries }
    end
  end
end

