class CommunityController < ApplicationController
  def index

    if defined? params[:page]
      @feed_entries = FeedEntry.find(:all, :offset => (params[:page].to_i * 10), :order => 'published_at desc', :limit => 10)
      # @feed_entries = FeedEntry.where().limit(5)
    else
      @feed_entries = FeedEntry.find(:all, :limit => 10, :order => 'published_at desc')
    end
    

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.xml  { render :xml => @feed_entries }
    end
  end
end
