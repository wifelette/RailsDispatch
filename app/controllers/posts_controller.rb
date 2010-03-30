class PostsController < ApplicationController
  
  def welcome
    @posts = Post.past.published.order('publish_date desc').limit(4)
    @upcoming = Post.published.future.order("publish_date asc").limit(1)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end


  def index
    # @posts = Post.published
    # @upcoming = Post.upcoming

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
  
  def show
    @post = Post.past.published.first(:conditions => {:slug => params[:slug]})
    @posts = Post.past.published.order('publish_date desc').limit(4)
    @upcoming = Post.published.future.order("publish_date asc").limit(1)
  end
  
end

