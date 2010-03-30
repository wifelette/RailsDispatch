class PostsController < ApplicationController
  
  def welcome
    @posts = Post.past.published.order('publish_date desc').limit(4)
    @upcoming = Post.published.future.order("publish_date desc").limit(1)
    @upcoming.to_a

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
    @post = Post.past.published.find(params[:id])
    @posts = Post.past.published
  end
  
end

