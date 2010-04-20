class Admin::Community::FeedsController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
  
  respond_to :html, :xml, :js
  
  def index
    @feeds = Feed.all
  end
  
  def new
    @feed = Feed.new
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = "Successfully created feed."
      redirect_to admin_community_feeds_url
    else
      render :action => 'new'
    end
  end
  
  def edit    
    @feed = Feed.find(params[:id])
  end
  
  def update
    @feed = Feed.find(params[:id])
    if @feed.update_attributes(params[:feed])
      flash[:notice] = "Successfully updated feed."
      redirect_to admin_community_feeds_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contributor = Contributor.find(params[:id])
    @contributor.destroy
    respond_with(@contributor, :location => admin_community_feeds_url)
  end
  
  
end
