class CommunityController < ApplicationController
  def index
    
    if defined? params[:page]
      @feed_entries = FeedEntry.find(:all, :offset => (params[:page].to_i * 5), :limit => 5)
      # @feed_entries = FeedEntry.where().limit(5)
    else
      @feed_entries = FeedEntry.find(:all, :limit => 5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feed_entries }
    end
  end
end
